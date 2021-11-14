### devops-10 student

### HW-7.5. Основы golang

---

1.</br>

```
[~/Documents/education/terraform_netology/golang]$ go version         *[main]
go version go1.17.3 darwin/arm64
```

2.</br>
Выполнено

3.</br>

```
package main

import "fmt"

func main() {

//Задача №3. Пункт1

	fmt.Println("Задача 3. Пункт 1")
	fmt.Print("Enter a length in meters: ")
	var input float64
	fmt.Scanf("%f", &input)

	output := input / 0.3048

	fmt.Println(output)

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
	z := [100]int{}
	y := z[:]
	k := 0
	for i := 0; i < len(z); i++ {
		z[i] = i + 1
		if z[i]%3 == 0 {
			y = append(y[:k], z[i])
			k++
		}
	}

	fmt.Println(z)
	fmt.Println(y)
}

```
Результаты выполнения программы *practice.go*:
```
golang|main⚡ ⇒ go run test.go
Задача 3. Пункт 1
Enter a length in meters: 1
3.280839895013123
Задача 3. Пункт 2
Минимальное значение в списке:  9
Задача 3. Пункт 3
[3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72 75 78 81 84 87 90 93 96 99 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100]
[3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72 75 78 81 84 87 90 93 96 99]
```

4.</br>
