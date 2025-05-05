#import the socket module
import socket


#define the function for the server communication
def client_program():
    myhost=socket.gethostname() #get the name of this computer
    myport=5000#port number to accept client connections
    #print(myhost)

    #get the instance of the socket 
    client_socket=socket.socket()


    #connect to the server
    client_socket.connect((myhost,myport))

    #getting the message to be senrt to the server
    mymessage=input("Enter the message to be sent to the server : ")
    
    #if the user is typing exit then close and exit the connection with the server and if not
    #exit then keep on sending mssg to the server
    while mymessage.lower().strip != 'exit':
        client_socket.send(mymessage.encode())#encod the mssg in the tcp  ip format and send
        #receive any data sent from the server
        received_data=client_socket.recv(1024).decode() #receive the msg from the server and decode
        #print the msg
        print("Message from the Server  and the message is ",str(received_data))
        #send a reply to the server using input() method
        mymessage=input('Type reply to the server here:')
    client_socket.close()  #close the connection

    

#whenever we execute the main program, it should run the server_program()

if __name__=='__main__':
    client_program()