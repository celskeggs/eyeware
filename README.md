# eyeware

[Diceware](http://world.std.com/~reinhold/diceware.html) is a popular method of generating a strong passphrase, using random selections from a list of 7776 words. **eyeware** is an alternative Diceware word list (`eyeware-wordlist` in the files above), consisting entirely of words found in Tolkien's *The Lord of the Rings*.

## The Forging of the List

The standard English Diceware [word list](http://world.std.com/~reinhold/diceware.wordlist.asc) consists, for the most part, of words limited to the lowercase English alphabet. eyeware elevates this tendency to a strict standard. In preparing the word list, capitals were converted to lowercase, diacritics were removed, and words containing non-letter glyphs (such as apostrophes or hyphens) were dropped. Additionally, word length was limited to 3-9 characters.

Subject to these filters, all words that appear two or more times in *The Lord of the Rings* are found in the eyeware word list. Single-occurence words were added, in alphabetical order, until the goal word total was reached.

## The Five Dice

To generate a passphrase with a Diceware word list (see the [official site](http://world.std.com/~reinhold/diceware.html) for full instructions):

- roll five dice (or one die five times) and read them left to right to get a 5-digit number
- find the corresponding word on the list
- repeat until [six words](http://world.std.com/~reinhold/dicewarefaq.html#howlong) have been generated for a standard passphrase, or seven words for a high-value passphrase
- use the words, in the order they were generated and with spaces between them, as your passphrase

For instance, your passphrase might be: `toby hew aught neighed rumoured spies son`.

It may be tempting to alter the passphrase to make it more memorable. **Do not remove or reorder any words or characters**, for it will compromise the randomness (and therefore security) of the phrase.

One approach to memorizing the passphrase is to add "connecting words" that make the phrase sound more natural.

`toby [didn't] hew aught [and] neighed [that it was] rumoured [that he] spies [on his] son`

By adding these words when reciting the passphrase in one's head, but not actually adding them to the typed passphrase, memorization can be eased without increasing the characters to be typed.

## The Randomness of the Computer

Alternatively, one can generate a passphrase [using a computer](http://world.std.com/~reinhold/dicewarefaq.html#computer). The Diceware author recommends using a slightly longer list (8192 words, to make it a whole power of two) for computer generation. The file `eyeware8k` (found above) was created for this purpose.

**Many methods of random number generation are insufficiently random for strong passphrase generation. Be sure to choose a quality source of randomness, such as in the example below.**

On Linux, one may run the command `for i in {1..7}; do shuf --random-source=/dev/random -n 1 < eyeware8k; done` to obtain a 7-word passphrase from the file "eyeware8k". The source of randomness here is the special file `/dev/random`, a random number generator built into the Linux kernel. It is considered [fully reliable](https://wiki.archlinux.org/index.php/Random_number_generation) for cryptographic generation.
