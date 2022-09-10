---

Title: Git Event

Author: Alireza Soltani Neshan

Date: 5/10/2022

---

# The Design System Fundamental

## The Four Design System Layers

A design system can be broken into four layers:

- Foundations
- Tokens
- Core Systems
- Components

### Foundations Layer

Include basics like logo, colors and photography styles
or even more details like a point of view on animation.

### Tokens Layer

Those design concepts are given a name and a value and
sometimes other attributes such as a role or state.
Once tokens have been defined, thy can be translated into
formats for use with multiple platforms.

Tokens allow design decisions to be documented in a platform-
agnostic and shareable format.

In simple manner, Design Tokens is bundle of name and value of
a thing in Design. Like there is a color, value of this color is
`#f312df`, Designer can't define this value as a name of a color!
So chose a proper name for that, Designer can say, This is `primary`
color. So developer will define this color in `colors.dart`:

In `colors.dart`:

```dart
const primaryColor = "#f312df";
```

Example of Tokenize value (Global Tokens):

- Colors, Opacities, Shadows
- Icons
- fonts-size, -weight, -family, letter-spacing, line-height
- border, -weight, -style
- spacing, media-query(breakpoints), transition, z-index

Benefit of Design Tokens:

- Tokens are a platform-agnostic format but they can be used
in platform-specific code.
- Tokens help maintain alignment and consistency in a design system.

### Core System Layer

A layer to solution to common interface challenges such as layout,
type scale, theming, etc...
Core systems are the reuseable "building-block" system to solve these
challenges. Core systems are build with tokens, which enables that "ease of changes".

### Components layer

Using some component reuseable, for multi-purpose not for a special time!
This component can range from simple (a button or text input or all things that you will
see inside of a UI)

## The Three Parts of the Design System Layer

Each of these four layers is made up of three parts that work together to make a design
system functional, educational, and sustainable. These parts are *Assets*, *Documentation*,
and *Processes*.

### Assets

All things that make Design System useable! Design kits, code libraries, software tools or even
install scripts and repositories. For example the Foundations layer is mostly educational. It contains
lots of documentation but few assets. On the other hand the Components Layer has many assets that can
be actively utilized to build digital interfaces.

### Documentation

Documentation is just what you would expect, a detailed explanation of why somethings is the way it is
and a breakdown of when and how to use it. Like assets, the style and scoop of documentation vary from
layer to layer. With the Foundation and Tokens Layers, documentation might include more information about the
reasoning behind choices that the organization has made, while for the Core Systems and Components Layer,
documentation is more instructional and practical.

### Processes

While assets are functional and documentation is educational, processes are what help us to create a sustainable
design system. in many ways, a design system is as much about a community of people as it is the tools and
technologies used. Process tie the two together.

### Knowledge

- ease of changes
- breaking change