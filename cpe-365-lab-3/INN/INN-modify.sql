/*
Alex Ye
aye01@calpoly.edu
*/
ALTER TABLE `Rooms`
    ADD Description VARCHAR(400);

UPDATE `Rooms`
    SET Description = "Nice room tucked away in the Inn with a nice view of the garden"
    WHERE RoomId = "RND";

UPDATE `Rooms`
    SET Description = "Experience the best comfort possible in this luxurious room."
    WHERE RoomId = "IBS";

UPDATE `Rooms`
    SET Description = "This rustic room looks of a very traditional lifestyle and true to our hotel's values"
    WHERE RoomId = "AOB";

UPDATE `Rooms`
    SET Description = "This spooky room is for the modern lover of darkness and seclusion. The most private room in the Inn."
    WHERE RoomId = "MWC";

UPDATE `Rooms`
    SET Description = "This room signls for the coming seasons with its beautiful view of our backyard of rolling hills."
    WHERE RoomId = "HBB";

UPDATE `Rooms`
    SET Description = "Room that never changed through the years. It is the remnence of what used to be."
    WHERE RoomId = "IBD";

UPDATE `Rooms`
    SET Description = "Experience luxury of our B&B for half the price!"
    WHERE RoomId = "TAA";

UPDATE `Rooms`
    SET Description = "Nice place for a gathering of friends to plan for a positive event!"
    WHERE RoomId = "CAS";

UPDATE `Rooms`
    SET Description = "Forget your troubles in this room of extreme confort. It is the epitome of a relaxing getaway."
    WHERE RoomId = "RTE";

UPDATE `Rooms`
    SET Description = "No worries if you want an affordable time at the Inn. This beautiful room is in anyone's budget!"
    WHERE RoomId = "FNA";

SELECT *
    FROM `Rooms`
    ORDER BY RoomId \G