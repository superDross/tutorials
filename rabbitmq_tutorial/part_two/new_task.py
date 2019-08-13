import sys

import pika

# connect to a broker on the local machine
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()

# create a queue named hello and make it durable;
# ensures messages and acks are not lost when the broker dies
channel.queue_declare(queue='hello', durable=True)

# message to send to the queue
message = ' '.join(sys.argv[1:]) or "Hello World!"

# send the body to the hello queue
channel.basic_publish(
    exchange='',
    routing_key='hello',
    body=message,
    # mark message as being persistant
    properties=pika.BasicProperties(
        delivery_mode=2
    )
)

print(f"[x] Sent {message}")
connection.close()
