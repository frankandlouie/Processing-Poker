public class Player
{
  private String card1;
  private String card2;
  private char rank;
  private char suit;
  private int cardWidth = 100;
  private int cardHeight = 150;
  
  public void setCard1(String name)
  {
    card1 = name;
  }
  
  public void setCard2(String name)
  {
    card2 = name;
  }
  
  public void setRank(char rank)
  {
    this.rank = rank;
  }
  
  public void setSuit(char suit)
  {
    this.suit = suit;
  }
  
  public String getCard1()
  {
    return card1;
  }
  
  public String getCard2()
  {
    return card2;
  }
  
  public char getRank()
  {
    return rank;
  }
  
  public char getSuit()
  {
    return suit;
  }
  
  //public void drawCard(String cardName, int x, int y)
  //{
  //  image(loadImage(cardName), x, y, cardWidth, cardHeight);
  //}
}
