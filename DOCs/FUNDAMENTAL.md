# The Design System Fundamental

## 

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
