# Sample Description of `arb` file formats

The `arb` file format related to `intl` package, to handle and generate app
localizations. If you don't know about that format, you can learn at this
document:

`arb` format is same to `json` files.

## Example

```arb
{
    "@@locale": "fa",
    "@settings": {
        "label: "App Settings",
        "description": "App settings description",
        "items": {
            "item1": "Item 1",
            ...
        }
    }
}
```

- @@locale: (optional) Global key for translated strings
- @settings: there is an `@` as prefix of key, It represents you can define
  values like `json` inside of that.