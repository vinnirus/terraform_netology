package practice

import (
	"fmt"
)

func main() {

	//Задача №3. Пункт1

	fmt.Println("Задача 3. Пункт 1")
	fmt.Print("Enter a length in meters: ")
	var input float64
	fmt.Scanf("%f", &input)

	lessonResult1 := ConvertValue(input)

	fmt.Println(lessonResult1)

	//Задача №3. Пункт2
	fmt.Println("Задача 3. Пункт 2")
	x := []int{48, 96, 86, 68, 57, 82, 63, 70, 37, 34, 83, 27, 19, 97, 9, 17}
	minElement := x[0]
	for _, v := range x {
		if v <= minElement {
			minElement = v
		}
	}
	fmt.Println("Минимальное значение в списке: ", minElement)

	//Задача №3. Пункт3

	fmt.Println("Задача 3. Пункт 3")
	myArray := [100]int{}

	for i := 0; i < len(myArray); i++ {
		myArray[i] = i + 1
	}

	fmt.Println(DivThree(myArray[:]))
}

func ConvertValue(value float64) float64 {

	output := value / 0.3048

	return output
}

func DivThree(z []int) []int {

	y := z[:]
	k := 0
	for i := 0; i < len(z); i++ {
		if z[i]%3 == 0 {
			y = append(y[:k], z[i])
			k++
		}
	}

	return y

}
