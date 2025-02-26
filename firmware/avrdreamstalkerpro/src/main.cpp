
#include <Arduino.h>

#include "ds_driver.h"
#include "ds_util.h"
#include "shared_fp.h"


/*-----------------------------------------------------------------------*/
SDFile shared_fp;


/*-----------------------------------------------------------------------*/
// put function declarations here:

/*-----------------------------------------------------------------------*/
void setup( ) {
  // put your setup code here, to run once

  driver.begin ();

  if (! driver.start () )
  {
    /* Handle the critical error */
    driver.reboot_on_key ();
  }

  // open a new file, write and close it:

  //Serial.println("Creating example.txt...");

  /*shared_fp = SD.open ( "example.txt", FILE_WRITE );

  // if the file opened okay, write to it:
  if ( shared_fp ) {
    //Serial.print("Writing to test.txt...");
    shared_fp.println("testing 1, 2, 3.");
    // close the file:
    shared_fp.close();
    //Serial.println("done.");
  } else {
    // if the file didn't open, print an error:
    //Serial.println("error opening test.txt");
  }
*/
}

/*-----------------------------------------------------------------------*/
void loop() {

  driver.process ();

  /* End of app loop */
  _NOP ();
}

