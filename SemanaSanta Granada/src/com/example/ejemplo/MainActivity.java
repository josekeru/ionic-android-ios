package com.example.ejemplo;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends Activity implements OnClickListener{
	
	ImageView foto;
	TextView tv;
	int[] fotoId = {R.drawable.ss1, R.drawable.ss2, R.drawable.ss3, R.drawable.ss4, R.drawable.ss5, R.drawable.ss6, R.drawable.ss7, R.drawable.ss8, R.drawable.ss9, R.drawable.ss10, R.drawable.ss11, R.drawable.ss12, R.drawable.ss13, R.drawable.ss14, R.drawable.ss15, R.drawable.ss16, R.drawable.ss17, R.drawable.ss18, R.drawable.ss19, R.drawable.ss20, R.drawable.ss21, R.drawable.ss22, R.drawable.ss23, R.drawable.ss24, R.drawable.ss25, R.drawable.ss26, R.drawable.ss27, R.drawable.ss28, R.drawable.ss29, R.drawable.ss30, R.drawable.ss31, R.drawable.ss32, R.drawable.ss33}; 
	String[] textos = {"borriquita","Santa Cena","Sentencia","Despojao","Cautivo","Trabajo","Dolores","Rescate","Huerto","San Agustín","Lanzada","Esperanza","Via-crucis","Cañilla","Gitanos","Estudiantes","Paciencia y Penas","Tres caidas","Nazareno","Salesianos","Aurora","Estrella","Concha","Silencio","Ferroviarios","Favores","Escolapios", "Santo Sepulcro","Soledad y Descendimiento", "Alhambra", "Resucitado y alegria","Facundillos","Resurección Regina Mundi"};
	int i = 0;
	int total;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		Button anterior = (Button) findViewById(R.id.button1);
		Button siguiente = (Button) findViewById(R.id.button2);
		anterior.setOnClickListener(this);
		siguiente.setOnClickListener(this);
		
		tv = (TextView) findViewById(R.id.textView1);
		foto = (ImageView) findViewById(R.id.imageView1);
		total = fotoId.length;
	}
	
	@Override
	public void onClick(View view) {
		
		int id = view.getId();
		if(id == R.id.button2) {
			i++;
			if(i == total){
				i = 0;
			}
		}
		
		if(id == R.id.button1) {
			i--;
			if(i == -1){
				i = total -1;
			}
		}
		foto.setImageResource(fotoId[i]);
		tv.setText(textos[i]);
		
	}
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.activity_main, menu);
		return true;
	}
}
