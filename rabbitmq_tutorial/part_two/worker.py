import time

import pika

# connect to the local messanger
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()

# make sure the queue exists
channel.queue_declare(queue='hello', durable=True)


def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)
    time.sleep(body.count(b'.'))
    print(" [x] Done")
    # send an ack back to rabbitMQ
    ch.basic_ack(delivery_tag=method.delivery_tag)


# don't dispatch a new message to a worker
# until it has processed and acknowledged the previous one
channel.basic_qos(prefetch_count=1)

# consume the output from the queue and parse it to
# the callback function
channel.basic_consume(
    queue='hello',
    on_message_callback=callback,
)

# intiate consumption
print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()
