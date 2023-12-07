public class poker
{
  final private int width = 1280, height = 720;
  final private int cardWidth = 100, cardHeight = 150;
  
  private int p1x = 1*width/5 - cardWidth/2, p1y = 2*height/3;
  private int p2x = 2*width/5 - cardWidth/2, p2y = 2*height/3;
  private int p3x = 3*width/5 - cardWidth/2, p3y = 2*height/3;
  private int p4x = 4*width/5 - cardWidth/2, p4y = 2*height/3;
  private int p5x = 5*width/5 - cardWidth/2, p5y = 2*height/3;

  //[0]: p1xy; [1]: p2xy; ... ; [4]: p5xy
  private int [] px = {1*width/6 - cardWidth/2, 2*width/6 - cardWidth/2, 3*width/6 - cardWidth/2, 4*width/6 - cardWidth/2, 5*width/6 - cardWidth/2};
  private int [] py = {2*height/3 - cardHeight/2, 2*height/3 - cardHeight/2, 2*height/3 - cardHeight/2, 2*height/3 - cardHeight/2, 2*height/3 - cardHeight/2};
  //[0] - [2]: The flop ; [3]: The turn; [4]: The river
  private int [] fiveX = {3*width/10 - cardWidth/2, 4*width/10 - cardWidth/2, 5*width/10 - cardWidth/2, 6*width/10 - cardWidth/2, 7*width/10 - cardWidth/2};
  private int [] fiveY = {height/4 - cardHeight/2, height/4 - cardHeight/2, height/4 - cardHeight/2, height/4 - cardHeight/2, height/4 - cardHeight/2};
  //[0]:First burn; ... ; [2]: Third burn
  private int [] burnX = {width/15, width/15 + cardWidth/5, width/15 + 2*cardWidth/5};
  private int [] burnY = {height/15, height/15 + cardHeight/5, height/15 + 2*cardHeight/5};
  
  private String [] theBurn = new String [3];
  private String [] theFlop = new String [3];
  private String theTurn = new String();
  private String theRiver = new String();
  
  private int [] theBurnCardNum = new int [3];
  private int [] theFlopCardNum = new int [3];
  private int theTurnCardNum;
  private int theRiverCardNum;

  
  private int cardCounter = 0;

  private Deck deck;
  private Player p1, p2, p3, p4, p5;
  
  private boolean cardsDealt = false;
  private boolean displayOnce = false;
  private boolean waveFinished = false;
  
  public poker()
  {
    deck = new Deck();
    deck.shuffleDeck();
    p1 = new Player();
    p2 = new Player();
    p3 = new Player();
    p4 = new Player();
    p5 = new Player();
  }
  
  public void incrementCardCounter()
  {
    cardCounter++;
  }
  
  public void dealCards()
  {
    p1.setCard1(deck.getCardName(cardCounter));
    incrementCardCounter();
    p2.setCard1(deck.getCardName(cardCounter));
    incrementCardCounter();
    p3.setCard1(deck.getCardName(cardCounter));
    incrementCardCounter();
    p4.setCard1(deck.getCardName(cardCounter));
    incrementCardCounter();
    p5.setCard1(deck.getCardName(cardCounter));
    incrementCardCounter();
    
    p1.setCard2(deck.getCardName(cardCounter));
    incrementCardCounter();
    p2.setCard2(deck.getCardName(cardCounter));
    incrementCardCounter();
    p3.setCard2(deck.getCardName(cardCounter));
    incrementCardCounter();
    p4.setCard2(deck.getCardName(cardCounter));
    incrementCardCounter();
    p5.setCard2(deck.getCardName(cardCounter));
    incrementCardCounter();
  }
  
  public void theFlop()
  {
    theFlop[0] = deck.getCardName(cardCounter);
    theFlopCardNum[0] = cardCounter;
    incrementCardCounter();
    theFlop[1] = deck.getCardName(cardCounter);
    theFlopCardNum[1] = cardCounter;
    incrementCardCounter();
    theFlop[2] = deck.getCardName(cardCounter);
    theFlopCardNum[2] = cardCounter;
    incrementCardCounter();
  }
  
  public void displayCard(String cardName, int x, int y)
  {
    image(loadImage(cardName), x, y, cardWidth, cardHeight);
  }
  
  public void displayPlayerHands(Player p, int a)
  {
    image(loadImage(p.getCard1()), px[a], py[a], cardWidth, cardHeight);
    adjustCardCoords(a);
    image(loadImage(p.getCard2()), px[a], py[a], cardWidth, cardHeight);
    adjustCardCoords(a);
  }
  
  public void displayFlop()
  {
    for(int i = 0; i < 3; i++)
    {
      displayCard(theFlop[i], fiveX[i], fiveY[i]);
    }
  }
  
  public void theTurn()
  {
    theTurn = deck.getCardName(cardCounter);
    theTurnCardNum = cardCounter;
    incrementCardCounter();
  }
  
  public void displayTurn()
  {
    displayCard(theTurn, fiveX[3], fiveY[3]);
  }
  
  public void theRiver()
  {
    theRiver = deck.getCardName(cardCounter);
    theRiverCardNum = cardCounter;
    incrementCardCounter();
  }
  
  public void displayRiver()
  {
    displayCard(theRiver, fiveX[4], fiveY[4]);
  }
    
  public void adjustCardCoords(int a)
  {
    px[a] += cardWidth/2; 
    py[a] += cardHeight/2;
  }
  
  public void displayBurnCards()
  {
    for(int i = 0; i < 3; i++)
    {
      displayCard(deck.deck.get(i).getBackSide(), burnX[i], burnY[i]);
    }
  }
  
  public void revealBurn()
  {
    for(int i = 0; i < 3; i++)
    {
      displayCard(theBurn[i], burnX[i], burnY[i]);
    }
  }
  
  public void burnCard()
  {
    for(int i = 0; i < 3; i++)
    {
      theBurn[i] = deck.getCardName(i);
      incrementCardCounter();
    }
  }
  
  public void runGame()
  {
    if(!waveFinished)
    {
      dealCards();
      burnCard();
      theFlop();
      burnCard();
      theTurn();
      burnCard();
      theRiver();
      
      displayPlayerHands(p1, 0);
      displayPlayerHands(p2, 1);
      displayPlayerHands(p3, 2);
      displayPlayerHands(p4, 3);
      displayPlayerHands(p5, 4);
      displayFlop();
      displayTurn();
      displayRiver();
      displayBurnCards();
      waveFinished = true;
    }
  }
}
