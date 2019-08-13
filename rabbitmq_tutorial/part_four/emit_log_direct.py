""" Sends a log to the exchange."""
import sys

import pika

# connect to a broker on the local machine
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()


# create an exchange named logs of type direct;
# bind a message to a specific queue and consumer
channel.exchange_declare(
    exchange='direct_logs',
    exchange_type='direct'
)

# determines which key to send the message to
severity = sys.argv[1] if len(sys.argv) > 1 else 'info'
# messages to send to the queue
message = ' '.join(sys.argv[2:]) or "Hello World!"

# send the body to the specific severity queue within the
# direct_logs exchange
channel.basic_publish(
    exchange='direct_logs',
    routing_key=severity,
    body=message,
)

print(f"[x] Sent {severity}:{message}")
connection.close()
