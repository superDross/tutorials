""" Sends a log to the exchange."""
import sys

import pika

# connect to a broker on the local machine
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()


# create an exchange named logs of type fanout;
# broadcasts all messages to all queues
channel.exchange_declare(
    exchange='logs',
    exchange_type='fanout'
)

# message to send to the queue
message = ' '.join(sys.argv[1:]) or "Hello World!"

# send the body to the logs exchange and use a temporary queue
channel.basic_publish(
    exchange='logs',
    routing_key='',
    body=message,
    # mark message as being persistant
    properties=pika.BasicProperties(
        delivery_mode=2
    )
)

print(f"[x] Sent {message}")
connection.close()
