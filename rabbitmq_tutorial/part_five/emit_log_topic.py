""" Sends a log to the exchange."""
import sys

import pika

# connect to a broker on the local machine
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()


# create an exchange named logs of type topic;
# bind a message to a specific queue and consumer
channel.exchange_declare(
    exchange='topic_logs',
    exchange_type='topic'
)

# determines which key to send the message to
routing_key = sys.argv[1] if len(sys.argv) > 1 else 'anonymous.info'
# messages to send to the queue
message = ' '.join(sys.argv[2:]) or "Hello World!"

# send the body to the specific severity queue within the
# topic_logs exchange
channel.basic_publish(
    exchange='topic_logs',
    routing_key=routing_key,
    body=message,
)

print(f"[x] Sent {routing_key}:{message}")
connection.close()
