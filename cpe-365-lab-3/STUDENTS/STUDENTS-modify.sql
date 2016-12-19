DELETE FROM `list` 
    WHERE Grade < 3 
    OR Grade > 4;

ALTER TABLE `list` 
    ADD Gpa FLOAT;

UPDATE `list` 
    SET Gpa=3.25 
    WHERE Grade = 4 
    AND Classroom = 110;

UPDATE `list` 
    SET Gpa=2.9 
    WHERE Grade = 4 
    AND Gpa IS NULL;

UPDATE `list` 
    SET Gpa=3.5 
    WHERE Grade = 3;

UPDATE `list` 
    SET Gpa=4.0 
    WHERE Last="PINNELL" 
    AND First="ROBBY";

UPDATE `list` 
    SET Gpa=3.7 
    WHERE Last="SAADE" 
    AND First="TOBIE";

UPDATE `list` 
    SET Gpa=Gpa+.3 
    WHERE Last="RODDEY" 
    AND First="CYRUS";

UPDATE `list` 
    SET Gpa=Gpa+(Gpa/4)
    WHERE Last="LEAPER" 
    AND First="ADRIAN";

UPDATE `list` 
    SET Gpa=Gpa+(Gpa/4) 
    WHERE Last="GROENEWEG" 
    AND First="CRYSTA";

SELECT * FROM `list` ORDER BY Gpa, Grade, Last;