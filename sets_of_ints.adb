-- Dewey Milton
-- Date Sep-12-2016
-- Program 1 Sets_of_ints.adb
-- Itec320-01
-- Takes in multiple sets of numbers
-- Calculates and displays Size, Average and the second largest element
-- Calculates Average of All Values and Averages, Prints Largest second Number

WITH ADA.Text_IO; USE ADA.Text_IO;
WITH ADA.Integer_Text_IO; USE ADA.Integer_Text_IO;
WITH ADA.Float_Text_IO; USE ADA.Float_Text_IO;


PROCEDURE Sets_Of_Ints IS

    package boolean_io is new ada.text_io.enumeration_io(Boolean);
    USE Boolean_Io;

    TYPE SetArray IS ARRAY(Positive RANGE <>) OF INTEGER;


        ----------------------------------------------------------
        -- Purpose: Finds the second largest value in a Set
        -- Parameters: setArray of INTEGERS
        -- Postcondition: Returns Second Largest INTEGER in the Array
        ----------------------------------------------------------
FUNCTION FindSecLargest(Set: setArray) RETURN INTEGER IS

      SecLargest, TmpDigit: INTEGER;

      newSet: setArray(1 .. Set'Last);

   BEGIN
      SecLargest := 0;    -- What will contain the second Largest int
      TmpDigit := 0;      -- Temporary place holder for bubble sort
      newSet := Set;      -- Creates a new array that can be modified

      FOR Iteration IN 1 .. (NewSet'Last - 1) LOOP

         FOR Pos IN NewSet'First .. (NewSet'Last - 1) LOOP


            IF NewSet(Pos) < NewSet(Pos + 1) THEN

			-- Places the larger values to the front

                  TmpDigit := NewSet(Pos);

                  NewSet(Pos) := NewSet(Pos + 1);

               NewSet(Pos + 1) := TmpDigit;

            END IF;

         END LOOP;

         SecLargest:= NewSet(2); -- Assigns the Second Largest value

   END LOOP;


   RETURN SecLargest;

END FindSecLargest;


        ----------------------------------------------------------
        -- Purpose: Checks to see if a Set has a Second Largest value
        -- Parameters: SetArray of INTEGER
        -- Precondition: IsSecLargest Boolean set False
        -- Postcondition: Returns True if there is a Second Largest value
        ----------------------------------------------------------
FUNCTION checkSecLargest(Set: SetArray) RETURN Boolean IS

      Found, Check : Integer;

      IsSecLargest : boolean;

      Begin

         Found := 0;  --The number of value variations

         Check := Set(1);  --Starts with first value of a Set

         IsSecLargest := False;  -- Becomes True if there is variation in values

         IF Check > 0 OR Check < 0 THEN

            Found := Found + 1;

         END IF;

         FOR Pos IN 1 .. Set'Last LOOP

            IF (Pos + 1) <= Set'Last THEN

               IF (Check < Set(Pos + 1)) OR (Check > Set(Pos + 1)) THEN

                  Found := Found + 1;

               END IF;

            End IF;

      END LOOP;

         IF Found >= 2 THEN  --True if two or more differences in value

            IsSecLargest:= True;

         END IF;

    RETURN IsSecLargest;

END checkSecLargest;



        ----------------------------------------------------------
        -- Purpose: Outputs the results of a single set
        -- Parameters: TotalOfSets, Size, Average, SecondLargest, Is2ndLargest: Results
        -- Postcondition: Result Output
        ----------------------------------------------------------
PROCEDURE PrintSet(TotalOfSets: IN Integer; Size: IN Natural; Average: IN Float;
                          SecondLargest: IN Integer; is2ndLargest: IN boolean) IS

         BEGIN

         Put("Set ");

         Put(TotalOfSets, 1);

         New_Line;

         Put("    ");

         Put("Size: ");

         Put(Size, 1);

         New_Line;

         Put("    ");

         Put("Average: ");

         Put(Average, 1,2,0);

         New_Line;

            IF Is2ndLargest THEN  --Prints if there is a second largest value

               Put("    ");

               Put("Second largest: ");

               Put(SecondLargest, 1);

               New_Line;

            END IF;

END PrintSet;




   ----------------------------------------------------------
   -- Purpose: Creates the set Array, Calls CheckLargestSec Function
   -- Calls FindSecLargest if Check returns true, Calculates and Prints Set
   -- Parameters: TotalOfSets; display set number, Size; how many digits to expect
   -- Precondition: Creates an array from the size of a set
   -- Postcondition: Returns Average of the set, SecondLargest of the set,
   -- Sum of the value, AsecLargest Boolean if there is a second largest
        ----------------------------------------------------------
PROCEDURE GetSet(TotalOfSets: IN INTEGER; Size: IN Natural; Average: OUT Float;
          SecondLargest: OUT INTEGER; Sum: Out Integer; AsecLargest: OUT Boolean) IS


      Input: Integer;   -- Input expected to be placed in the array

      Set: SetArray (1 .. Size);  -- Creates an array to the size of the set

   BEGIN

      AsecLargest := False;  -- Sets Second Largest trigger to False

      Average := 0.0;   -- Average of the set

      SecondLargest := 0; -- Second Largest of the Set

      Sum := 0;     -- Sum of the values in a set


      FOR Pos IN 1 .. Size LOOP    -- Builds the set array

            Get(Input);

            Sum := Sum + Input;

            Set(Pos) := Input;

      END LOOP;

    ASecLargest := CheckSecLargest(Set);  -- Checks for a Second Largest Value

       IF ASecLargest THEN

         SecondLargest := FindSecLargest(Set);  -- Finds the Second Largest value if True

       END IF;

    Average:= Float(Sum) / Float(Size);  -- Calculates the Average of the set

    PrintSet(TotalOfSets, Size, Average, SecondLargest, AsecLargest);  -- Calls the PrintSet Procedure


END GetSet;



PROCEDURE IncramentValues(Size: IN Natural; SizeTotal: IN OUT INTEGER;
                                          TotalOfSets: IN OUT INTEGER) IS

         BEGIN

         sizeTotal:= sizeTotal + size;

         TotalOfSets:= TotalOfSets + 1;



END IncramentValues;

        ----------------------------------------------------------
        -- Purpose: Adds over all values of from each set
        -- Parameters: TotalSum of all Values, SumValues of current set
        -- SumAverages of all sets, Average of current set
        -- Precondition: Values entered of previous sets
        -- Postcondition: Returns TotalSum and SumAverages of all the Sets
        ----------------------------------------------------------
PROCEDURE AddValues(TotalSum: IN OUT INTEGER; SumValues: IN INTEGER;
                       SumAverages: IN OUT Float; Average: IN Float) IS

         BEGIN

         TotalSum := TotalSum + SumValues;

         SumAverages := SumAverages + Average;


END AddValues;


        ----------------------------------------------------------
        -- Purpose: Compares whether there is a Largest Second Largest Value
        -- Parameters: IsAlargest Boolean if there was a Second Largest
        -- NewLargest is previous Second Largest, LargestSoFar is Largest value so Far
        -- Precondition: current value if any of Largest Second Largest
        -- Postcondition: Returns updated value for Largest Second Largest
        ----------------------------------------------------------
PROCEDURE FindLargest(IsAlargest: IN Boolean; NewLargest: IN INTEGER; LargestSoFar: IN OUT INTEGER) IS

    BEGIN

       IF IsAlargest AND LargestSoFar = 0 THEN

	   -- Saves the first Second Largest Value

          LargestSoFar := NewLargest;

       ELSIF  IsAlargest AND NewLargest > LargestSoFar THEN

	   -- Compares new value to previous largest value

          LargestSoFar := NewLargest;

       END IF;


END FindLargest;



        ----------------------------------------------------------
        -- Purpose: Calculates and Outputs final result of total set information
        -- Parameters: TotalSum, SizeTotal, SumAverages, TotalOfSets, LargestSoFar
        -- Precondition: Total Information collected from all the previous sets
        -- Postcondition: Outputs Average of set values, Average of Averages,
        --                and Largest Second Largest
        ----------------------------------------------------------
PROCEDURE CreateResults(TotalSum: IN INTEGER; SizeTotal: IN INTEGER; SumAverages: IN Float; TotalOfSets: IN INTEGER; LargestSoFar: IN INTEGER) IS

     AveAverages, Average: Float;  -- Will hold the Average of Averages
                                   -- and the Average of all values from the sets

     BEGIN

        Put("Average of values: ");

        Average:= Float(TotalSum) / Float(SizeTotal);

        Put(Average,1,2,0);

        New_Line;

        Put("Average of Averages: ");

        AveAverages:= SumAverages / Float(TotalOfSets);

        Put(AveAverages,1,2,0);

        New_Line;

        Put("Largest Second Largest: ");

        Put(LargestSoFar,1);

     END CreateResults;




      Size : Natural;         -- Will hold the Size of a Set

      SecondLargest : INTEGER; -- Will hold the SecondLargest value of a set

      TotalOfSets : INTEGER; -- Total number of Sets

      LargestSoFar : INTEGER; -- Will hold the Largest of Second Largest values

      SumValues : INTEGER;  -- Total of current Set values

      TotalSum : INTEGER; -- Total of all Set values

      SizeTotal:  INTEGER; -- Total number of Inputs in all Sets

      Average : Float; -- Current Set Average

      SumAverages: Float; -- Total of all Set Averages

      isAlargest: boolean; -- True if current Set has a Second Largest

BEGIN

   SumValues:= 0;

   TotalSum:= 0;

   SumAverages:= 0.0;

   TotalOfSets:= 0;

   LargestSoFar:= 0;

   SizeTotal:= 0;

   IsAlargest:= False;

      Get(Size);

      WHILE Size /= 0 LOOP

         New_Line;

         IncramentValues(size, sizeTotal, TotalOfSets);

         GetSet(TotalOfSets, Size, Average, SecondLargest, SumValues, isAlargest);

         AddValues(TotalSum, SumValues, SumAverages, Average);

         FindLargest(isAlargest, SecondLargest, LargestSoFar);

         Get(Size);

      END LOOP;

      New_Line;

      CreateResults(TotalSum, SizeTotal, SumAverages, TotalOfSets, LargestSoFar);


      END Sets_Of_ints;

