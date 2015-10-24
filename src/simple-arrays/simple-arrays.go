package main

import "fmt"

type rel [2]string

var aRb = rel{"a", "b"}
var aRc = rel{"a", "c"}
var cRd = rel{"c", "d"}
var dRa = rel{"d", "a"}
var dRd = rel{"d", "d"}

func main() {
	fmt.Println(aRb, aRc, cRd, dRa, dRd)
}
