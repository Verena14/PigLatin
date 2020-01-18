public void setup()
{
//  String[] lines = loadStrings("words.txt");
  String[] lines = {"beast", "dough", "happy", "question", "star", "three", "eagle", "try"};
  System.out.println("There are " + lines.length + " lines.");
  for(String temp : lines)
  {
    System.out.println(pigLatin(temp));
  }
  
  String[] lowellHymn = {"With heads bared we stand", "In tribute to thee", "Our Alma-Mater Lowell", "All true to thee we'll be", "Unfurled red and white", "None shall thee decry", "They name we love", "Oh Lowell High"};
  
  System.out.println();
  System.out.println("The Lowell Hymn in Pig Latin:");
  int count = 1;
  char b;
  for(int i = 0; i < lowellHymn.length; i++)
  {
    String temp = lowellHymn[i];
    if(count % 4 == 0)
    {
      b = '.';
    }else{
      b = ',';
    }
    lowellHymn[i] = linePigLatin(temp);
    temp = lowellHymn[i];
    lowellHymn[i] = temp.substring(0, temp.length() - 1) + b;
    if(count == 5)
    {
      System.out.println();
    }
    System.out.println(lowellHymn[i]);
    count++;
  }
}


public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord. If there are no vowels, returns -1
{
  char t;
  for(int i = 0; i < sWord.length(); i++)
  {
    t = sWord.charAt(i);
    if(t == 'a' || t == 'e' || t == 'i' || t == 'o' || t == 'u')
    {
      return i;
    }
  }
  return -1;
}



public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  int index = findFirstVowel(sWord);
  if(index == 0)
  {
    return sWord + "way";
  }
  if(index == -1 || sWord.length() < 2)
  {
    return sWord + "ay";
  }
  //return "ERROR!";
  String back = sWord.substring(0, index);
  String front = sWord.substring(index);
  if(sWord.length() >= 2 && sWord.substring(0,2).equals("qu"))
  {
     back = "qu";
     front = sWord.substring(2);
  }
  return front + back + "ay";
}


public String linePigLatin(String str)
{
  //breaking up the sentence/phrase
  ArrayList <String> sentence = new ArrayList <String>();
  int a = 0;
  int index;
  while(true)
  {
    index = findFirstSpace(str.substring(a));
    //System.out.println(str.substring(a));
    if(index > 0)
    {
      sentence.add(str.substring(a, a+index));
      a += index+1;
    }
    //System.out.println(index);
    if(index < 0)
    {
      //System.out.println("it worked");
      if(str.substring(a).length() > 0)
      {
        sentence.add(str.substring(a));
      }
      break;
    }
  }
  //dealing with capitals and reforming the sentence/phrase
  String res = "";
  char t;
  String temp;
  boolean uCase;
  for(int i = 0; i < sentence.size(); i++)
  {
    temp = sentence.get(i);
    //int index = findFirstVowel(temp);
    t = temp.charAt(0);
    uCase = Character.isUpperCase(t);
    
    if(uCase)
    {
      t = Character.toLowerCase(t);
      sentence.set( i, t + temp.substring(1) );
      uCase = true;
    }
    sentence.set(i, pigLatin( sentence.get(i) ) + " ");
    temp = sentence.get(i);
    if(uCase)
    {
      sentence.set(i, Character.toUpperCase(temp.charAt(0)) + temp.substring(1));
    }
    res += sentence.get(i);
  }
  return res;
}


public int findFirstSpace(String str)
{
  for(int i = 0; i < str.length(); i++)
  {
    if( Character.isWhitespace(str.charAt(i)) )
    {
      return i;
    }
  }
  return -1;
}
