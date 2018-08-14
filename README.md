# IMU-RangeOfMotion
Capstone Project

The project utilizes two Arduino's, two MPU-6050 IMU's, two HC-05 Bluetooth Modules, and 4 Lithium-Ion Batteries to create two seperate fully functional sensing systems. One could then be placed on the upper arm and one on the lower arm to detect range of motion.

The Arduino was coded in the Arduino IDE and downloaded to the arduino with the help of an open source C++ I2C Dev library that initialized the digitial motion processor(DMP) on the MPU-6050. Only the yaw, pitch, and roll from the I2C Dev library was used to calculate the range of motion. Bluetooth serial communication was established in order to send the data wirelessly to the computer.

Processing IDE was used on the computer to calculate the angle between the two IMU's and draw lines to visually represent the movement of the arm. To do this I used the pitch of the IMU’s to get an angle that each IMU was being tilted at. With these two angles I could calculate the slope of a line for the upper and lower arm. Once I had the slope of the lines I chose a length the two lines would be. With the length of each line and the slope of each line I could calculate the end points.

The Processing program received the pitch data from the IMU's over bluetooth from the Arduino's. At every iteration it would draw two lines. The upper arm line would start at a fixed position to act as the shoulder and the lower arm line would start wherever the upper arm line ended at each iteration. This intersection of the lower and upper arm would represent the elbow. Finally, I was able to calculate the angle between these two lines so I could output the angle between the two IMU’s onto the screen along with the visual representation.

![end points](https://user-images.githubusercontent.com/27930636/44106423-7e4b7c18-9fa9-11e8-94ac-088484f4cd43.JPG)

![angle](https://user-images.githubusercontent.com/27930636/44106296-1b249fa2-9fa9-11e8-87ac-371d8a9a9c68.JPG)

The final system had three computers running code. There were algorithms running on the two Arduino’s and the PC. The Arduino sends pitch data and the PC is processes that data to draw two sperate lines on the computer representing the humorous and the fore arm and calculates the angle between the two lines.
