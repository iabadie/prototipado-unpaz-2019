extends Sprite

func _on_Area2D_area_entered(area):
	queue_free(); # <- elimina el nodo del arbol (tambien borra la instancia)
	pass
