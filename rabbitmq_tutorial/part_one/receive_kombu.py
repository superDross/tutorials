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


def get_name(body, message):
    print(f'His name is {body["name"]}')
    message.ack()


with connection.Consumer([queue], callbacks=[get_name]) as consumer:
    while True:
        connection.drain_events()
