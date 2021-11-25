//www.elegoo.com
//2016.12.08

int buzzer = 3;//the pin of the active buzzer
int high = 750;
int test = 75;
void setup()
{
 pinMode(buzzer,OUTPUT);//initialize the buzzer pin as an output
}
void loop()
{
  //  test = 50;
  //  for(int i = 0; i < 500; i++)
  //  {
  //    digitalWrite(buzzer,HIGH);
  //    delayMicroseconds(test);//wait for 1ms
  //    digitalWrite(buzzer,LOW);
  //    delayMicroseconds(test);//wait for 1ms
  //  }
  
  //  test = 100;
  //  for(int i = 0; i < 400; i++)
  //  {
  //    digitalWrite(buzzer,HIGH);
  //    delayMicroseconds(test);//wait for 1ms
  //    digitalWrite(buzzer,LOW);
  //    delayMicroseconds(test);//wait for 1ms
  //  }
  
  //  test = 250;
  //  for(int i = 0; i < 300; i++)
  //  {
  //    digitalWrite(buzzer,HIGH);
  //    delayMicroseconds(test);//wait for 1ms
  //    digitalWrite(buzzer,LOW);
  //    delayMicroseconds(test);//wait for 1ms
  //  }

  test = 375;
  for(int i = 0; i < 200; i++)
  {
    digitalWrite(buzzer,HIGH);
    delayMicroseconds(test);//wait for 1ms
    digitalWrite(buzzer,LOW);
    delayMicroseconds(test);//wait for 1ms
  }
  
  test = 750;
  for(int i = 0; i < 200; i++)
  {
    digitalWrite(buzzer,HIGH);
    delayMicroseconds(test);//wait for 1ms
    digitalWrite(buzzer,LOW);
    delayMicroseconds(test);//wait for 1ms
  }

  test = 1000;
  for(int i = 0; i < 100; i++)
  {
    digitalWrite(buzzer,HIGH);
    delayMicroseconds(test);//wait for 1ms
    digitalWrite(buzzer,LOW);
    delayMicroseconds(test);//wait for 1ms
  }

  test = 1500;
  for(int i = 0; i < 75; i++)
  {
    digitalWrite(buzzer,HIGH);
    delayMicroseconds(test);//wait for 1ms
    digitalWrite(buzzer,LOW);
    delayMicroseconds(test);//wait for 1ms
  }

  //  test = 2000;
  //  for(int i = 0; i < 50; i++)
  //  {
  //    digitalWrite(buzzer,HIGH);
  //    delayMicroseconds(test);//wait for 1ms
  //    digitalWrite(buzzer,LOW);
  //    delayMicroseconds(test);//wait for 1ms
  //  }
}


// Vary drive frequency from 2500 Hz to 500 Hz with 50% duty cycle
// Divide 50 MHz by 20,000 to 100,000
// Function: distance * 80000 / 3300 + 20000
