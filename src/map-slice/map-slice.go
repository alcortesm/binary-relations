package main

import "fmt"

type rel map[string][]string

var r = rel{
	"a": []string{"a", "b"},
	"c": []string{"d"},
	"d": []string{"a", "d"},
}

func main() {
	fmt.Println(r)
}
