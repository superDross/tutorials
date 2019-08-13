import pika

# connect to a broker on the local machine
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)
channel = connection.channel()

# create a queue named hello
channel.queue_declare(queue='hello')

# send the body to the hello queue
channel.basic_publish(
    exchange='',
    routing_key='hello',
    body='Hello World!'
)

print(" [x] Sent 'Hello World!'")
connection.close()
