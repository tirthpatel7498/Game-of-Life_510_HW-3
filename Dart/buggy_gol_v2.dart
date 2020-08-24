import 'dart:math';
import 'dart:io';
import 'dart:core';

//Checks no. of neighbours around a particular point
int checkNeighbours(a,i,j,rows,cols)
  {
    var count=0; //counts no. of neighbours
    var nr=rows-1; 
    var nc=cols-1;
    

    if(i==0)
    {
       if(j==0)
        {  if(a[i+1][j+1]==1)   //bottom-right
                count+=1;
           if(a[i+1][j]==1)     //bottom
                count+=1;
           if(a[i][j+1]==1)     //right
                count+=1;
        }
       else if(j==nc)
        {
            if(a[i+1][j]==1)    //bottom
                count+=1;
            if(a[i+1][j-1]==1)  //bottom-left
                count+=1;
            if(a[i][j-1]==1)    //left
                count+=1;
        }
       else
        {   if(a[i][j-1]==1)    //left
                count+=1;
            if(a[i][j+1]==1)    //right
                count+=1;
            if(a[i+1][j]==1)    //bottom
                count+=1;
            if(a[i+1][j-1]==1)  //bottom-left
                count+=1;
            if(a[i+1][j+1]==1)  //bottom-right
                count+=1;
        }
    }
    else if(i==nr)
    {  
       if(j==0)
        {  if(a[i-1][j+1]==1) //top-right
                count+=1;
           if(a[i-1][j]==1)   //top
                count+=1;
           if(a[i][j+1]==1)   //right
                count+=1;
        }
       else if(j==nc)
        {  if(a[i-1][j]==1)   //top
                count+=1;
           if(a[i-1][j-1]==1) //top-left
                count+=1;
           if(a[i][j-1]==1)   //left
                count+=1;
        }
       else
        {   if(a[i][j-1]==1)  //left
                count+=1;
            if(a[i][j+1]==1)  //right
                count+=1;
            if(a[i-1][j]==1)  //top
                count+=1;
            if(a[i-1][j-1]==1)//top-left
                count+=1;
            if(a[i-1][j+1]==1)//top-right
                count+=1;
        }
    }
    else
    {   if(j==0)
        {  if(a[i-1][j+1]==1) //top-right
                count+=1;
           if(a[i-1][j]==1)   //top
                count+=1;
           if(a[i][j+1]==1)   //right
                count+=1;
           if(a[i+1][j]==1)   //bottom
                count+=1;
           if(a[i+1][j+1]==1) //bottom-right
                count+=1; 
        }               
       else if(j==nc)
        {  if(a[i-1][j]==1) //top
                count+=1;
           if(a[i-1][j-1]==1) //top-left
                count+=1;
           if(a[i][j-1]==1) //left
                count+=1;
           if(a[i+1][j-1]==1) //bottom-left
                count+=1;
           if(a[i+1][j]==1) //bottom
                count+=1;
        }            
       else
        {   if(a[i][j-1]==1)//left
                count+=1;
            if(a[i][j+1]==1)//right
                count+=1;
            if(a[i-1][j]==1)//top
                count+=1;
            if(a[i+1][j]==1)//bottom
                count+=1;                
            if(a[i-1][j-1]==1)//top-left
                count+=1;
            if(a[i+1][j-1]==1) //bottom-left
                count=1;                
            if(a[i-1][j+1]==1)//top-right
                count+=1;
            if(a[i+1][j-1]==1)//bottom-right
                count+=1;
        }
    }                
    return count;
  }

//Generates new generation
golnewgen(a,b,rows,cols)
  {
    for(int i=0; i<rows;i+=1)
        {
          for(int j=0; j<cols;j+=1)
          {
            if(a[i][j]==1)
            { 
                var nbr = checkNeighbours(a,i,j,rows,cols);
                if(nbr == 0 || nbr == 1 || nbr == 4 || nbr == 5 || nbr == 6 || nbr == 7 || nbr == 8)
                    a[i][j]=0;
                else if(nbr == 2 || nbr == 3)
                    a[i][j]=1;
            }
            else if(a[i][j]==0)
            {   
                var nbr = checkNeighbours(a,i,j,rows,cols);
                if(nbr == 0 || nbr == 2 || nbr == 1 || nbr == 4 || nbr == 5 || nbr == 6 || nbr == 7 || nbr == 8)
                    a[i][j]=0;
                else if(nbr == 3)
                    a[i][j]=1;
            } 
          }
        }
    return a;
  }

//To clear the terminal/command prompt screen
void clearScreen() 
{
  if(Platform.isWindows) {
    // not tested, I don't have Windows
    // may not to work because 'cls' is an internal command of the Windows shell
    // not an executeable
    print(Process.runSync("cls", [], runInShell: true).stdout); 
  } else {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}

//For printing the matrix in the form of design of 'o'
void printDesign(a,rows,cols)
{
    for(int i=0; i<rows; i+=1)
    {
      for(int j=0; j<cols; j+=1)
      {
        if(a[i][j]==1)
        {
          stdout.write("o ");
        }
        else
        {
          stdout.write("_ ");
        }
      }
      print("");
    }  
}

//checkExtinction Method for checking whether the specified population has gone extinct or not
int checkExtinction(a,rows,cols){
    for(int i=0; i<rows; i+=1)
    {
      for(int j=0; j<cols; j+=1)
      {
        if(a[i][j]==1)
        {
          return 1;
        }
        else
        {
          continue;
        }
      }
    }
    return 0;  
}  

void testcode()
{
  var test1=[[0,0,0,0,0],
         [0,0,1,0,0],
         [0,0,1,0,0],
         [0,0,1,0,0],
         [0,0,0,0,0]];

  var test2=[[0,0,0,0,0],
         [0,0,0,0,0],
         [0,1,1,1,0],
         [0,0,0,0,0],
         [0,0,0,0,0]];

  var gens=4;
  var testcount=0;

  var a=test1;
  
  for(int i =0;i<gens;i+=1)
  {
    var randomGenerator = Random();
    var b=List.generate(5, (m) => List.generate(5, (n) => randomGenerator.nextInt(1)));
    a=golnewgen(a,b,5,5);

    if(i==0 || i==2)
    {testcount+=compareMatrix(a,test2);}
    else
    {testcount+=compareMatrix(a,test1);}

  }

  if(testcount==4)
  {print("Test Passed");}
  else {print("Test NOT Passed");}

}

int compareMatrix(a,b)
{
  int unmatched=0;
  for(int i=0; i<a.length; i+=1)
  {
    for(int j=0;j<a[0].length; j+=1)
    {
       if(a[i][j]!=b[i][j])
       {unmatched+=1;}
    }
  }

  if(unmatched==0)
  {return 1;}
  else{return 0;}
}

void main(List<String> args) 
{
  //Getting rows, cols, gens from user command-line arguement
  var rows=int.parse(args[0]); var cols=int.parse(args[1]); var gens=int.parse(args[2]);

  var randomGenerator = Random();
  Duration sleeptimer = new Duration(hours:0, minutes:0, seconds:2);

  //Generate a matrix of prespecified rows & cols with random population
  var a = List.generate(rows, (i) => List.generate(cols, (j) => randomGenerator.nextInt(2)));

  //Printing the initial population
  clearScreen();       
  print("Press Ctrl+C to terminate the program.");
  print("");
  print("Initial population");
  printDesign(a,rows,cols);
  sleep(sleeptimer); 
  
  //Iterating through generations
  for(int i = 0; i<gens; i+=1)
  {  

    clearScreen();

    var x = i+1; 
    var b=List.generate(5, (m) => List.generate(5, (n) => randomGenerator.nextInt(1)));

    print("Press Ctrl+C to terminate the program.");
    print("");
    print("generation "+ x.toString()+"");
    
    a=golnewgen(a,b,rows,cols); //Getting new generation from golnewgen method.
    
    printDesign(a,rows,cols);   //Printing new gen

    if(checkExtinction(a,rows,cols)==1){} //A check whether the population has gone extinct before the generation loop terminates or not.
    else{ print(""); print("The population has gone extinct. Terminating the program."); sleep(sleeptimer); break;}
    //print(a);
    sleep(sleeptimer);
    
  }
  clearScreen();

  testcode();
}


  //    C   N                 new C
  //    1   0,1             ->  0  // Lonely
  //    1   4,5,6,7,8       ->  0  // Overcrowded
  //    1   2,3             ->  1  // Lives
  //    0   3               ->  1  // It takes three to give birth!
  //    0   0,1,2,4,5,6,7,8 ->  0  // Barren




