import pika

# connect to the local messanger
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()

# make sure the queue exists
channel.queue_declare(queue='hello')


def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)


# consume the output from the queue and parse it to
# the callback function
channel.basic_consume(
    queue='hello',
    on_message_callback=callback,
    auto_ack=True
)

# intiate consumption
print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()
