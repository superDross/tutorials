import sys
import pika

# connect to the local messanger
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()

channel.exchange_declare(
    exchange='direct_logs',
    exchange_type='direct'
)

# create an empty temp queue to connect each message to
# and ensure it is deleted after the consumer connection
# is closed (exclusive)
result = channel.queue_declare('', exclusive=True)

# get the queue name declared by the broker
queue_name = result.method.queue

# args as the routing_keys to accept messages from
severities = sys.argv[1:]
if not severities:
    sys.stderr.write(
        f'Usage: {sys.argv[0]} [info] [warning] [error]\n'
    )
    sys.exit(1)

# tell us to only consume messages with the given routing_key
# attribute (severities var)
for severity in severities:
    channel.queue_bind(
        exchange='direct_logs',
        queue=queue_name,
        routing_key=severity
    )

print(' [*] Waiting for logs. To exit press CTRL+C')


def callback(ch, method, properties, body):
    print(f' [x] {method.routing_key}:{body}')


# consume the output from the queue and parse it to
# the callback function (which is declared as the
# consumer here)
channel.basic_consume(
    queue=queue_name,
    on_message_callback=callback,
    auto_ack=True
)

channel.start_consuming()
