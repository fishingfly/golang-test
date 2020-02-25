package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("hello zhouyu!")
	r := gin.Default()
	r.GET("/test", func(c *gin.Context) {

		c.JSON(200, gin.H{
			"nextUrl": " POST https://github.com/login/oauth/access_token",
		})
	})
	r.Run()
}
