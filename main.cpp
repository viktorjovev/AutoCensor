#include <windows.h>
#include <bits/stdc++.h>
using namespace std;
string text;
fstream myfile("BadWords.txt");
vector<string>BAD_WORDS;
string word;

void Stealth() {
    HWND hWnd;
    AllocConsole();
    hWnd = FindWindowA("ConsoleWindowClass", NULL);
    ShowWindow(hWnd, 0);
}
void LoadBadWords()
{
    if (myfile.is_open())
       while (getline (myfile,word))
       BAD_WORDS.push_back(word);
    myfile.close();
}
int main()
{
   LoadBadWords();
   Stealth();
   char key;
    while(true)
    {
        Sleep(10);
        for(key=8; key<=255; key++)
            if(GetAsyncKeyState(key)==-32767)
              {
                if(int(key)==VK_SPACE || int(key)==VK_SHIFT || int(key)==VK_RETURN || int(key)==VK_TAB || int(key)==VK_CAPITAL)
                 { ::text.clear(); continue;}

                   ::text+=key;
                    if(find(BAD_WORDS.begin(),BAD_WORDS.end(),::text)!=BAD_WORDS.end()){
                    MessageBox(HWND_DESKTOP,"WARNING! WARNING! WARNING!\n      DON'T USE BAD WORDS","AntiCensor",MB_SYSTEMMODAL);
                        ::text.clear();
                    }
                }
       }
}

