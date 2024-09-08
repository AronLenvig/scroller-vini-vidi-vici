extends CanvasLayer

@onready var score = $score_card/Score
@onready var Kleo = $score_card/Kleopatra
@onready var victory_label = $score_card/victory_label
@onready var animation_player = $AnimationPlayer
@onready var amount_labe = $score_card/amount_needed

var victory_reweld

func _ready() -> void:
	amount_labe.visible = false
	score.text = "0 :Soldiers"
	Kleo.text = "0 :Cleopatras"
	update_score()
	if Global.soldiers > 4000:
		victory_label.text = "VICTORY!"
		victory_reweld = true
	else:
		victory_label.text = "YOU LOSE"
		victory_reweld = false
	
func update_score() -> void:
	var shown_score = 0
	var shown_kleo = 0
	while shown_score < Global.soldiers:
		shown_score += min(100,Global.soldiers - shown_score)
		score.text = str(shown_score) + " Soldiers"
		await get_tree().create_timer(0.02).timeout
	while shown_kleo < Global.cleopatras:
		shown_kleo += min(1,Global.cleopatras - shown_kleo)
		Kleo.text = str(shown_kleo) + "/5 Cleopatras"
		await get_tree().create_timer(0.1).timeout
	await  get_tree().create_timer(0.5).timeout
	animation_player.play("Points_tally")
	
	if victory_reweld:
		$JuliusVictory.visible = true
		$story_label.text = "You saw their army as you arrived, came without hesitation, and conquered them in an instant as they fled the battlefield."
		$Label.text = "veni, vidi, vici"
		if Global.cleopatras >= 5:
			await get_tree().create_timer(2).timeout
			Transition.transition()
			await Transition.on_tansition_finished
			get_tree().change_scene_to_file("res://cleopatra_scene.tscn")
	else:
		$Label.text = "Defeat! too few men"
		$story_label.text = "Your forces were too small, and the enemy overwhelmed them. Next time, bring at least 4,000 men."
		$JuliusDefeat.visible = true
		pass

func _on_reset_pressed() -> void:
	Transition.transition()
	await Transition.on_tansition_finished
	get_tree().change_scene_to_file("res://Sceans/intro_cutscenes.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
