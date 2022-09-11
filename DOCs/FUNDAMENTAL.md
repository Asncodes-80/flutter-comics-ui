---

Title: Fundamental of Design System

Author: Alireza Soltani Neshan

Date: 5/10/2022

---

# The Design System Fundamental

At First: What is in a Design System?

Design Systems included the usual suspects, fonts and colors, components
and documentations, grids, and layouts,etc..

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

## They Anatomy in Practice

### For Foundations layer: Color

#### Documentation

- Guidelines for the kinds of considerations needed like accessibility, consistency and etc...
- High-level explanations for things like multi-brand experiences, dark or light mode, or high contrast mode.
- Numerous color levels such as neutral, primary brand color and secondary and tertiary color.
- Explanations for the reasoning behind the color usage, such as communicating an emotion, ensuring brand
consistency, using colors to communicate hover or focus states, etc...

#### Process

- Communication between the organizational brand team and the design system team
- Ensuring info about color change is shared appropriately
- Adding new brand colors to the foundations layer
- Removing or changing brand colors in the Foundations layer

#### Assets

- Due to the conceptual nature of the Foundations Layer, there are no assets for color

### For Tokens layer: Color

#### Documentation

- How to name tokens
- The value of each token and their attributes (like color role, color state, color variant, color theme,
color family)
- Levels and hierarchy of tokens
- Best practices for using tokens and the intended use for each token
- Ownership and status for each token

#### Process

- Adding new color tokens
- Modifying existing color tokens
- Deprecating color tokens
- Testing color tokens
- How subscribers log issues or request features
- How to Transform tokens for use in new platforms

#### Assets

- A token management system
- The tools and scripts used to translate the tokens
- Token file for platform

### Core Systems Layer: Color

#### Documentation

- How each core system works
- Best practices for using those systems
- **Information on migrating to** and extending those system (describe some info about your UI Kit system)
- Identifying the current status of each system and who owns it

#### Process

- Keeping color systems in sync across platforms and tools
- Adding, modifying or deprecating color core systems
- Testing color core systems
- Reporting issues with current systems
- Requesting new color core system features

#### Assets

- Color use or theming systems build with SaaS, Css or other frameworks
- Color contrast checkers
- Color palette files for use in design tools


### Component Layer: Color

#### Buttons

You can think about buttons as the opposite. Buttons, though they will be a factor in almost every
design system, don't start at the Foundation layer. An org doesn't make an executive-level decision
about what a button looks like on an app. Instead, a button is **the product of many decision** that come
before it: organization stands (Foundation layer), tokens (Tokens Layer), and core systems (Core Systems layer)
that lead to components.


### Components Layer: Buttons:

#### Documentation

For each component, you will need detailed documentation about what it is, when and how to use it,
and all its variants. For a button, this might mean:

- Breaking the button down and giving names to all of its pieces (the border, the background, the text,
the icons, etc.)
- Explaining when and when not to use a button
- Explaining all the button's variations and their purpose
- Explaining how to size the button
- Explaining how to position the button (perhaps using core systems like layout or grid)
- A breakdown of the interaction that are possible with the button
- How content should be considered for the text of the button

_Note_: you will also need documentation written specifically for the users of the design tools
and development frameworks you are supporting.(How to install it, use, extend, within the specific tool or
framework, etc.) Finally, it's important to offer a way to indicate the current status and an future planned work
for the component. This will build trust will your subscribers and create some accountability for you and your team.

Component-level documentation is where most of your subscribers will spend the bulk of their time. That means this
content is absolutely critical to their success.

## Conclusion

Design systems have enormous potential to help elevate the creation of digital experiences for your company.
My hope is that this model (The anatomy of a design system) will help you to define the necessary clarity for
your team or event your minimal scale project.

It's also important to remember that a design system is more than just a set of components. The components are
the product of layers of intentional work that begin with the most fundamental elements of brand and identity.
