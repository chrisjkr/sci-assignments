package krszwsk.kek3;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Switch unit = (Switch) findViewById(R.id.unit);
        final EditText input = (EditText) findViewById(R.id.input);
        final TextView output = (TextView) findViewById(R.id.output);

        input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                convert(unit, output, input);
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        unit.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                convert(unit, output, input);
            }
        });

    }

    public void convert(Switch unit, TextView output, EditText input) {
        if(input.getText().length() > 0) {
            double inputValue = Float.valueOf(input.getText().toString());
            if(unit.isChecked()) {
                output.setText(String.valueOf(inputValue * 0.6214));
            }
            else {
                output.setText(String.valueOf(inputValue * 1.6));
            }
        }
        else {
            output.setText(":T");
        }
    }
}
