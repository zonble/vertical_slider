# vertical_slider

A vertical slider Flutter widget, that helps to present and adjust a value from
0.0 to 1.0.

## Example

Here comes a simple example:

``` dart
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
          color: Colors.black,
          child: Center(
              child: Container(
                  width: 100,
                  height: 300,
                  child: VerticalSlider(
                    backgroundColor: Colors.white38,
                    foregroundColor: Colors.white,
                    value: 0.5,
                    onValueChanged: (value) {
                      print(value);
                    },
                  )))));
```
