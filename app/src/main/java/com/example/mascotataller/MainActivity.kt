package com.example.mascotataller

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        regis.setOnClickListener{
            var saltar: Intent = Intent(this, ventana01::class.java)

            startActivity(saltar)
        }
        lista.setOnClickListener{
            var saltar: Intent = Intent(this, ventana02::class.java)
            startActivity(saltar)
        }
    }
}