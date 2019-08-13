from kombu import Connection, Exchange, Queue

exchange = Exchange(
    'exchange-test',
    type='direct',
    durable=True
)
queue = Queue(
    'test-queue',
    exchange=exchange,
    routing_key='test-route'
)
connection = Connection(
    'amqp://guest:guest@localhost//'
)

producer = connection.Producer(
    serializer='json'
)

producer.publish(
    {'name': 'Wee Jimmy'},
    exchange=exchange,
    routing_key='test-route',
    declare=[queue]
)

connection.close()


# class RabbitPublisher(object):
#     """
#     Base Rabbit connection for publishers
#     """

#     def __init__(self, rabbit_url, exchange):
#         self._connect(rabbit_url, exchange)

#     def _connect(self, rabbit_url, exchange):
#         parameters = pika.URLParameters(rabbit_url)
#         connection = pika.BlockingConnection(parameters)
#         channel = connection.channel()
#         channel.exchange_declare(exchange=exchange,
#                                  exchange_type='topic', durable=True)
#         self.channel = channel
#         self.connection = connection

class KombuPublisher:
    def __init__(self, rabbit_url, exchange):
        self._connection(rabbit_url, exchange)

    def _connection(self, rabbit_url, exchange_name):
        connection = Connection(rabbit_url)
        exchange = Exchange(exchange_name, type='topic', durable=True)
        channel = connection.channel()
        exchange(channel).declare()

        self.connection = connection
        self.channel = channel


class BasicKombuPublisher(KombuPublisher):
    def publish(self, change_id, namespace_change):
        routing_key = f'{namespace_change.name}'
        payload = {
            'data': namespace_change.new,
            'namespace_name': namespace_change.name,
            'operation': namespace_change.operation,
            'change_id': change_id
        }
        producer = self.connection.Producer(
            serializer='json'
        )

        self.channel.basic_publish(
            exchange=settings.namespaces_exchange,
            routing_key=routing_key,
            body=json.dumps(payload),
            properties=pika.BasicProperties(
                delivery_mode=PERSISTENT_DELIVERY_MODE
            )
        )
        producer.publish(
            json.dumps(payload),
            exchange=settings.namespace_exchange,
            routing_key=routing_key,
