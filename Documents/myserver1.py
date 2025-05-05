#import the socket module
import socket


#define the function for the server communication
def server_program():
    myhost=socket.gethostname() #get the name of this computer
    myport=5000#port number to accept client connections
    #print(myhost)
    # #get the name of this computer
    myport = 5000 #port no to accept  client connections

    #get the instance of the socket and bind the host and port together
    server_socket = socket.socket()
    server_socket.bind((myhost,myport))#pass the arg as tuple

    #listen to the socket with a mx of 2 connections at a time
    server_socket.listen(2)
    print("Server running at",str(myhost),'listening to port',str(myport))
    #accept any incoming connection requests
    ##accept() fn will return the connection obj and client's address
    myclient_connection,mycient_address = server_socket.accept()
    print("Incoming connection from client:"+str(myclient_address))
    

    #receinving the data stream while true(while there is valid data incoming)
    while True:
        #receive the packet data with max size as 1024 bytes
        #decode the packet data to extract the text data
        received_data = myclient_connection.recv(1024).decode()
        if not received_data:
            break #if no valid data is received,then break the while loop
        #else proceed with printing the data
        print("Message from client",str(mycient_address),",the message is",str(received_data))
        #send a reply to the client using input() method
        myreply = input('Type reply to client here:')
        myclient_connection.send(myreply.encode())
    myclient_connection.close() #close the connection
#when ever we execute the main program ,it should run the server_program() function
if __name__ == '__main__':
    server_program()