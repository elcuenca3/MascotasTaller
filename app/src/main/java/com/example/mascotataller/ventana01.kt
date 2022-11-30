package com.example.mascotataller

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.google.firebase.firestore.FirebaseFirestore
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.activity_ventana01.*

class ventana01 : AppCompatActivity() {
    private val db = FirebaseFirestore.getInstance()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_ventana01)
        setup()

    }
    fun setup(){
        title="inicio"
        guardar.setOnClickListener{
            db.collection("pets").document().set(
            hashMapOf("nombre" to name.text.toString(),"edad" to edad.text.toString()
                , "raza" to raza.text.toString()
                ,"color" to color.text.toString())
            )
            var saltar: Intent = Intent(this, MainActivity::class.java)
            startActivity(saltar)
        }



    }
}