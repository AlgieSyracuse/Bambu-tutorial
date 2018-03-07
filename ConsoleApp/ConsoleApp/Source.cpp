#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main() {

	string f1 = "screen_output(origin).txt";
	string f2 = "screen_output(new).txt";

	ifstream ifs1(f1), ifs2(f2);
	if (!ifs1 || !ifs2) {
		cout << "open file error\n";
		exit(1);
	}

	ofstream ofs("diff_contents.txt");

	string line1, line2;
	int cnt = 0;
	while (getline(ifs1, line1) && getline(ifs2, line2)) {
		++cnt;
		if (line1 != line2) {
			ofs << cnt << "\t" << line1 << "  ::::  " << line2 << endl;
		}
	}


	ifs1.close();
	ifs2.close();
	ofs.close();

	return 0;
}