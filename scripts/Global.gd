extends Node

signal muertePlayer

var sigueVivo = true


func playerDeath():
	muertePlayer.emit()
