# textobj-backticks

This plugin provides text objects for blocks inside backticks.

## Usage

There are three objects provided. Two of them are the obvious ones,
and the third may be useful for some particular cases.

The obvious ones:
* `` a` ``: All the text inside the backticks, including the backticks.
* `` i` ``: All the text inside the backticks, without the backticks.

The special one:
* `` ii` ``: All the text inside the backticks, excluding all the space after
the opening backtick and all the space before the closing backtick.

This can be useful, for example, when editing HTML templaes inside backticks
in javascript:

```javascript
var template = `
   <div>
      Hello world
   </div>
`;
```

That way, you can edit the template without having to re-indent.

## Caveats

Given the symmetric nature of backticks, there is no (easy) way to know
if you are inside an opening and closing backtick, or if you are inside
a closing and an opening backtick. So, use with caution.

## Full disclosure

You can obtain the same basic functionality with
[vim-textobj-between](https://github.com/thinca/vim-textobj-between). Using
this plugin you just save a keystroke and get the inside-but-without-whitespace
functionality.

## Installation

Copy the files to your plugin directory, or use 
[pathogen](https://github.com/tpope/vim-pathogen).
