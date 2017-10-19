package ru.first.endpoint;
import javax.xml.ws.Endpoint;
import ru.first.ws.ScorringService;

public class ScorringServicePub {
    public static void main (String... args)
    {
        Endpoint.publish("http://localhost:1986/ws/Scorring",new ScorringService());

    }
}
