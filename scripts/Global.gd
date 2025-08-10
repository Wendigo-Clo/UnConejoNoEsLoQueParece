extends Node

signal muertePlayer

var sigueVivo = true
var serpienteLlena = false

func playerDeath():
	muertePlayer.emit()
