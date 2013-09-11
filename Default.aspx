<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <div id="mainContent">
        <h1>Chinese Open Face Poker!</h1>
        <div id="playerOne">
            <div class="cardContainer">
                <div class="topRow">
                    <div class="card"></div>
                    <div class="card"></div>
                    <div class="card"></div>
                </div>
                <div class="clr"></div>
                <div class="middleRow">
                    <div class="card"></div>
                    <div class="card"></div>
                    <div class="card"></div>
                    <div class="card"></div>
                    <div class="card"></div>
                </div>
                <div class="clr"></div>
                <div class="bottomRow">
                    <div class="card"></div>
                    <div class="card"></div>
                    <div class="card"></div>
                    <div class="card"></div>
                    <div class="card"></div>
                </div>
                <div class="clr"></div>
            </div>
        </div>

        <div class="cardContainer">
        </div>
        <div class="clr"></div>

        <div class="deck">
            <div class="playerOneStartingCards">
                <h2>Click here to start!</h2>
            </div>
            <div class="card">
                <span class="topCard"></span>
            </div>
            <div class="drawPile">
                <div class="card">
                    Draw Pile
                </div>
            </div>
            <div class="clr"></div>
        </div>
        <div class="clr"></div>

        <div class="cardContainer">
        </div>

        <div class="cardContainer">
        </div>

    </div>

    <script type="text/javascript">
        $(function () {

            // Utility function to easily print out the card
            var cardToString = function () {
                // Create the card
                var sRetval = this.rank + " " + this.suit;
                return sRetval;
            };

            // Creating a card object
            var Card = function (rank, suit) {
                // properties
                this.rank = rank;
                this.suit = suit;

                // methods
                this.cardToString = cardToString;
            };

            // Create the deck of cards
            var createDeck = function () {
                var rank = new Array("A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2");
                var suit = new Array("&hearts;", "&diams;", "&clubs;", "&spades;");

                // Create the deck
                this.cards = new Array(52);

                var iCounter = 0;
                for (i = 0; i < rank.length; i++) {
                    for (j = 0; j < suit.length; j++) {
                        this.cards[iCounter] = new Card(rank[i], suit[j]);
                        iCounter++;
                    }
                }
            };

            // Shuffling the deck of cards
            // Randomly replacing the current card with a random one in the deck
            var shuffleDeck = function () {

                for (j = 0; j < 7; j++)
                    for (i = 0; i < this.cards.length; i++) {
                        iRandom = Math.floor((Math.random() * 51) + 1);
                        tempCard = this.cards[i];
                        this.cards[i] = this.cards[iRandom];
                        this.cards[iRandom] = tempCard;
                    }

            };

            // Draw five cards to begin the game
            var drawFive = function (e) {
                $(e + " h2").fadeOut();

                // Draw the top five cards
                $(e).append("<div class='card'>" + this.cards[0].cardToString() + "</div>" +
                            "<div class='card'>" + this.cards[1].cardToString() + "</div>" +
                            "<div class='card'>" + this.cards[2].cardToString() + "</div>" +
                            "<div class='card'>" + this.cards[3].cardToString() + "</div>" +
                            "<div class='card'>" + this.cards[4].cardToString() + "</div>");

                switch (e) {
                    case ".playerOneStartingCards":
                        playerOne.hand.cards.splice(0, 0, this.cards[0]);
                        playerOne.hand.cards.splice(0, 0, this.cards[1]);
                        playerOne.hand.cards.splice(0, 0, this.cards[2]);
                        playerOne.hand.cards.splice(0, 0, this.cards[3]);
                        playerOne.hand.cards.splice(0, 0, this.cards[4]);
                        break;
                    case ".playerTwoStartingCards":
                        playerTwo.hand.cards.splice(0, 0, this.cards[0]);
                        playerTwo.hand.cards.splice(0, 0, this.cards[1]);
                        playerTwo.hand.cards.splice(0, 0, this.cards[2]);
                        playerTwo.hand.cards.splice(0, 0, this.cards[3]);
                        playerTwo.hand.cards.splice(0, 0, this.cards[4]);
                        break;
                    case ".playerThreeStartingCards":
                        playerThree.hand.cards.splice(0, 0, this.cards[0]);
                        playerThree.hand.cards.splice(0, 0, this.cards[1]);
                        playerThree.hand.cards.splice(0, 0, this.cards[2]);
                        playerThree.hand.cards.splice(0, 0, this.cards[3]);
                        playerThree.hand.cards.splice(0, 0, this.cards[4]);
                        break;
                    case ".playerFourStartingCards":
                        playerFour.hand.cards.splice(0, 0, this.cards[0]);
                        playerFour.hand.cards.splice(0, 0, this.cards[1]);
                        playerFour.hand.cards.splice(0, 0, this.cards[2]);
                        playerFour.hand.cards.splice(0, 0, this.cards[3]);
                        playerFour.hand.cards.splice(0, 0, this.cards[4]);
                        break;
                }

                // Remove the 5 cards from the deck
                this.cards.splice(0, 5)

            };

            // Creating a deck object
            var Deck = function () {

                // properties
                this.cards = new Array();

                // methods
                this.createDeck = createDeck;
                this.shuffleDeck = shuffleDeck;
                this.drawFive = drawFive;
            };

            // Creating a player object
            var Player = function () {

                // properties
                this.hand = new Deck();
                this.score = 0;
            };

            // Add the selected card to a hand
            var assignCardToHand = function (card, ui) {
                //console.info(ui.position);
                //console.info(ui.offset);
                var initalCards = $(ui.helper).parent("div").attr("class");
                switch (initalCards) {
                    case "playerOneStartingCards":
                        // Depending on the position of the stop, put it in the appropriate level of the hand
                        break;
                }
            };

            //Initialize the deck and counters
            var aDeck = new Deck();
            aDeck.createDeck();
            aDeck.shuffleDeck();

            // on click of the draw pile, draw the top card of the draw pile
            $('.drawPile').on('click', function () {
                // Clear the top card
                $('.topCard').html('');
                // Show the top card if there are more cards
                if (aDeck.cards[0] != null && aDeck.cards.length > 0) {
                    $('.topCard').append(aDeck.cards[0].cardToString());
                    aDeck.cards.splice(0, 1)
                }
                else {
                    $('.topCard').append("No More Cards!");
                }
            });

            // Keeping track of the players hands
            playerOne = new Player();
            playerTwo = new Player();
            playerThree = new Player();
            playerFour = new Player();


            // drawing the first five cards to start the game
            $('.playerOneStartingCards h2').on('click', function () {
                aDeck.drawFive('.playerOneStartingCards');

                // Drag the initial cards to their desired locations
                $(".playerOneStartingCards .card").draggable({
                    snap: ".cardContainer .card",
                    stop: function (e, ui) { assignCardToHand(e, ui); }
                });
            });
        });
    </script>

</asp:Content>
