import pika

# connect to the local messanger
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()

channel.exchange_declare(
    exchange='logs',
    exchange_type='fanout'
)

# create an empty temp queue to connect each message to
# and ensure it is deleted after the consumer connection
# is closed (exclusive)
result = channel.queue_declare('', exclusive=True)

# get the queue name declared by the broker
queue_name = result.method.queue

# tell the exchange to send messages to the aformentioned
# queue
channel.queue_bind(
    exchange='logs',
    queue=queue_name
)

print(' [*] Waiting for logs. To exit press CTRL+C')


def callback(ch, method, properties, body):
    print(" [x] %r" % body)


# consume the output from the queue and parse it to
# the callback function
channel.basic_consume(
    queue=queue_name,
    on_message_callback=callback,
    auto_ack=True
)

channel.start_consuming()
