const int  buzzer_pin = 9;


/* Usage : Open --> Moniteur Série --> "b [fréquence]" */


void setup()
{
    pinMode(buzzer_pin, OUTPUT);
    Serial.begin(9600);
}

void loop()
{
    if (Serial.available()>0)
    {
        char buzzer_picked = Serial.read();
        int buzzer_freq = Serial.parseInt();
        Serial.println(buzzer_freq);
        Serial.println(buzzer_picked);
        write_freq(buzzer_picked, buzzer_freq);
    }
}

void write_frequency(char buzzer, int frequency)
{
    if (buzzer == 'b')
    {
        tone(buzzer_pin, frequency, 2000);
        return;
    }
    
    return;
}
