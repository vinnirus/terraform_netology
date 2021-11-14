package practice

import "testing"

func TestConvertValue(t *testing.T) {
	if ConvertValue(3048) != 10000 {
		t.Error("Func convertValue is working with ERROR")
	}
	if ConvertValue(1) == ConvertValue(2) {
		t.Error("Func convertValue is working with ERROR")
	}
}
