---
layout  : wiki
title   : Java + Android Studio 문제해결 
summary : troubleshooting cookbook 
date    : 2023-01-30 19:45:15 +0900
updated : 2023-01-30 21:46:42 +0900
tag     : android android-intent android-activity startactivityforresult
toc     : true
public  : true
parent  : [[Java-Category]] 
latex   : false
fontawe : false
---
* TOC
{:toc}

#  How to deal with the starActivityForResult() deprecation 

- I was on the way to following [this getting started documents](https://developer.android.com/courses/fundamentals-training/toc-v2) of Android Studio.
- But I was stucked at [this step of the documents](https://developer.android.com/codelabs/android-training-create-an-activity?index=..%2F..%2Fandroid-training#5) because the `startActivityForResult()`is deprecated.
- I didn't want to stop this clone coding at the last step of that course so I started to find a solution for this issue.
- [This StackOverflow answer](https://stackoverflow.com/a/66345734/9457247) gives me an solution so I replaced the deprecated code.
  - the old deprecated way ( extracted from [this link](https://github.com/google-developer-training/android-fundamentals-apps-v2/blob/51b6e3017fe9a50a958e77acea57e70dc59960f9/TwoActivities/app/src/main/java/com/example/android/twoactivities/MainActivity.java))
    ```java
    
    public class MainActivity extends AppCompatActivity {
     
        ...
         
        public void launchSecondActivity(View view) {
            Log.d(LOG_TAG, "Button clicked!");
            Intent intent = new Intent(this, SecondActivity.class);
            String message = mMessageEditText.getText().toString();
            intent.putExtra(EXTRA_MESSAGE, message);
            startActivityForResult(intent, TEXT_REQUEST);
        }
         
        @Override
        public void onActivityResult(int requestCode, int resultCode, Intent data) {
            super.onActivityResult(requestCode, resultCode, data);

            if (requestCode == TEXT_REQUEST) {
                if (resultCode == RESULT_OK) {
                    String reply = data.getStringExtra(SecondActivity.EXTRA_REPLY);
                    mReplyHeadTextView.setVisibility(View.VISIBLE);
                    mReplyTextView.setText(reply);
                    mReplyTextView.setVisibility(View.VISIBLE);
                }
            }
        }
    }
    ```
  - the new androidx way ( TEXT_REQUEST not used. delete it!)
    ```java
    public class MainActivity extends AppCompatActivity {
      ...
      
      public void launchSecondActivity(View view) {
          Log.d(LOG_TAG, "Button clicked!");
          Intent intent = new Intent(this, SecondActivity.class);
          String message = mMessageEditText.getText().toString();
          intent.putExtra(EXTRA_MESSAGE, message);
          launchSomeActivity.launch(intent);
      }

      ActivityResultLauncher<Intent> launchSomeActivity = registerForActivityResult(
          new ActivityResultContracts.StartActivityForResult(),
          new ActivityResultCallback<ActivityResult>() {
              @Override
              public void onActivityResult(ActivityResult result) {
                  if (result.getResultCode() == Activity.RESULT_OK) {
                      String reply = result.getData().getStringExtra(SecondActivity.EXTRA_REPLY);
                      mReplyHeadTextView.setVisibility(View.VISIBLE);
                      mReplyTextView.setText(reply);
                      mReplyTextView.setVisibility(View.VISIBLE);
                  }
              }
          }
      );   
    }
    ```
