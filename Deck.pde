import java.util.*;
 
class Deck
{
  private ArrayList <Card> deck = new ArrayList<Card>();
  
  public Deck()
  {
    int deckIndex = 0;
    int rank, currentSuit;
    char [] cardSuits = {'h', 's', 'c', 'd'};
    
    //Controls how many decks you want created
    for(int i = 0; i < 1; i++)
    {
      for(currentSuit = 0; currentSuit < 4; currentSuit++)
      {
        for(rank = 2; rank <= 14; rank++, deckIndex++)
        {
          deck.add(new Card(cardSuits[currentSuit], rank, ""+cardSuits[currentSuit]+rank+".png"));
        }
      }
    }
  }
  
  public void shuffleDeck()
  {
    Random r = new Random();
    
    for(int i = 51; i > 0; i--)
    {
      int j = r.nextInt(i+1);
      
      Card tempCard = deck.get(i);
      deck.set(i, deck.get(j));
      deck.set(j, tempCard);
    }
  }
  
  public String getCardName(int a)
  {
    return deck.get(a).getCardImage();
  }
  
  //public void displayDeck()
  //{
  //  float cardX = width/16;
  //  float cardY = height/6;
  //  float xPos = 0;
  //  float yPos = 0;
  
  //  for(int i = 0; i < deck.size(); i++)
  //  {
  //    image(loadImage(deck.get(i).getCurrentCardImage()), xPos, yPos, cardX, cardY);
  //    xPos += cardX;
    
  //    if(xPos % width == 0)
  //    {
  //      xPos = 0;
  //      yPos += cardY;
  //    }
  //  }
  //}
}
