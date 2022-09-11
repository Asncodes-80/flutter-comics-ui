# Design Documentation

At this documentation you will read about design system of this project. What is our components? How we customize their properties? How we can create new unique object? How we can work with CustomPainter and Patting Flutter classes to make new objects?

## Guidelines, widget and components

## Palette, Theme and Colors

### Typography

At this project we use two locales, English and Persian (Fa). At English we use two main font family, Integral-CF and Poppins. Integral-CF with all their types, use it to headlines, some ink titles and somethings like that. Poppins will use to demonstrate bodies, some titles, labels, switches and etc...

We create a super simple widget in `/lib/widgets/comic_text.dart`. Contains three text layer inside of a `Stack`. The first Text is main Shadow of the text, Second text is Stroke of the text and at the last text is main text.

// TODO: Write doc about Persian locale

Base on [Colourlovers](https://colourlovers.com), The Comic book characters are traditionally colorful, but those who pay special attention will note that it's not all random palettes. In fact, there's a science to How colors are used in your favorite comic, and while it may seem like a small thing, the inks used **Drastically** Affect your experience as *reader*.

Heroes vs villains the most traditional color scheme is Black vs White, with the darker colors usually symbolizing evil. However, over time, this has evolved to include more colors, and some comic artists actually play on our expectations to turn villains into unlikely heroes.

_Note:_ This is only simple guide for developers to develop their typography with this method!

Common color scheme for good guys common color scheme for bad guys:

### Color Scheme

|        Colors        |        Used for                                         |
|:--------------------:|:-------------------------------------------------------:|
| Black&White          | Messiah type hero                                       |
| Blue                 | Ultimate hero                                           |
| Blood red            | Crazy villain                                           |
| Bright Red           | Ultimate hero                                           |
| Purple               | Associated with poison                                  |
| Green                | Japanese comic books                                    |
| Dark Blue            | Evil characters                                         |
| Pink                 | Radioactive characters sometimes used for female heroes |
| Gray Silver          | Mentor the Arrogant                                     |
| Gold                 | Incredible hero at everythings                          |
| Yellow               | Weaker hero or sidekick tech savvy kid in the group     |
| Black                | The reluctant hero                                      |
| READ and Blue        | Wonder woman, SpiderMan, Superman, Captain America      |
| Blue and Yellow      | X-Men                                                   |
| Red and Yellow       | Iron Man and Daredevil                                  |
| Green and Purple     | Not 100% heroes                                         |
| Green,Purple, Orange | Bad guys tend to be secondary colors                    |
