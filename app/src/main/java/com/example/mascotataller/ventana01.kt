package com.example.mascotataller

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.activity_ventana01.*

class ventana01 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_ventana01)

        guardar.setOnClickListener{
            var saltar: Intent = Intent(this, MainActivity::class.java)

            startActivity(saltar)
        }
    }
}