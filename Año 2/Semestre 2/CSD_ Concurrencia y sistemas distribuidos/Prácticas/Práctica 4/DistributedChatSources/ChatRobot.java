// This file must be implemented when completing activity 2
//

import java.rmi.*;
import java.rmi.registry.*;
import java.rmi.server.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

//
// ChatRobot implementation
//
public class ChatRobot extends ChatClientCSD {

    private final String nickName;

    public ChatRobot(ChatConfiguration conf, String nick) {
        super(conf);
        nickName = nick;
    }

    //
    // The first thing to do before chatting is to connect to a ChatServer!!
    //
    // For us, connect means to locate it, register a new user into it and retrieve its channel list.
    // On success, returns the server channel list.
    //
    /**
     *
     * @throws java.lang.Exception
     */
    public void doConnect() throws Exception {
        String serverName = conf.getServerName();
        String channelName = conf.getChannelName();

        try {
            Registry reg = LocateRegistry.getRegistry(conf.getNameServiceHost(),
                    conf.getNameServicePort());
            srv = (IChatServer) reg.lookup(serverName);
        } catch (RemoteException | NotBoundException ex) {
            Logger.getLogger(ChatRobot.class.getName()).log(Level.SEVERE, null, ex);
        }

        myUser = new ChatUser(nickName, this);

        if (!srv.connectUser(myUser)) {
            throw new Exception("Nick ya utilizado");
        }

        bConnected = true;
        IChatChannel ch = srv.getChannel(channelName);

        if (ch == null) {
            throw new Exception("El canal no ha sido encontrado");
        }

        ch.join(myUser);
        System.out.println(nickName + " conectado al servidor: " + serverName
                + " canal " + channelName);
    }

    //
    // ISA MessageListener
    // Messages come from a channel or from a remote user.
    //
    /**
     *
     * @param msg
     */
    @Override
    public void messageArrived(IChatMessage msg) {
        String channelName = conf.getChannelName();
        try {
            IChatUser src = msg.getSender();
            Remote dst = msg.getDestination();
            String str = msg.getText();

            if (!msg.isPrivate()) {
                ChatChannel c_dst = (ChatChannel) dst;
                if (src == null) {
                    String nick = null;
                    if (str.startsWith(ChatChannel.JOIN)) {
                        nick = str.substring(ChatChannel.JOIN.length() + 1);
                        doSendChannelMessage(channelName, "Hola: " + nick);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    //
    // Main program, just creates the Client object, the program frame and shows it.
    // 
    public static void main(String[] args) {
        ChatRobot cr = new ChatRobot(ChatConfiguration.parse(args), "David");
        try {
            cr.doConnect();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}