% temel mantiksal islemler

1 == 2                 					        % false
1 ~= 2                 					        % true, esit degildir icin ~ sembolu kullaniliyor
1 && 0                 					        % false
1 || 0                 					        % true
xor(1,0)               					        % xor islemi

PS1('>> ')             					        % sintaksi ile prompt degistirilebilir

% degiskenler

a = 3                  					        %sintaksi ile bir deger bir degiskene atanabilir
a = 3;                 					        % bu kullanimla atanan deger yazdirilmaz sadece
                       					        % atama islemi yapilir          
b = 'hi'               					        % sintaksi ile bir string deger atamasi yapilabilir
c = (3>=1)             					        % sintaksi ile bir boolean deger atamasi yapilabilir
who                    				         	% who komutu ile Octave'ın o anda bellekte tuttugu 
                      					        % degiskenler gorulebilir
whos                   					        % whos komutu daha detayli bilgi verir
clear a                					        % a degiskeni silinir
a = pi                 					        % a degiskenine pi degeri ataniyor
a                      					        % basitce degisken ismini yazarak degerini yazdirabiliriz
disp(sprintf('2 decimals: %0.2f', a) 	  % seklinde formatli yazdirma yapabiliriz
format short           					        % varsayilan tercihtir, daha kisa bir format ile yazdirilir
format long            					        % long tercihi ile degiskenler daha uzun formatta yazdirilir

% vektor ve matrisler

A = [1, 2; 3, 4; 5, 6] 					        % sintaksi ile 3 x 2 boyutunda bir matris ataması yapilir
v = [1 2 3]            					        % sintaksi ile bir satir vektoru olusturulur
v = [1; 2; 3]          					        % sintaksi ile bir sutun vektoru olusturulur
v = [1:0.1:2]          					        % sintaksi ile baslangic degeri 1, artis miktari 0.1 ve
                       					        % bitis degeri 2 olacak sekilde bir satir vektoru olustulur
ones(2,3)              					        % tum elemanlari 1 olan 2x3 boyutunda bir matris olusturur
2*ones(2,3)            					        % tum elemanlari 2 olan 2x3 boyutunda bir matris olusturur
zeros(1, 3)            					        % tum elemanlari 0 olan 1x3 boyutunda satir vektoru olusturur
rand(2, 3)             					        % elemanlar rastgele degerler alan bir matris olusturur
hist(A)                					        % histogram cizdirir
hist(A, 5)             					        % ikinci argüman ile histogram kutularinin sayisi belirlenir
eye(4)                 					        % 4x4 boyutunda bir birim matris olusturur 
help eye               					        % arguman olarak gecirilen fonksiyonun dokumantasyonunu verir
size(A)                					        % matrisin boyutlarini satir vektoru olarak dondurur
size(A, 1)             					        % satir sayisini verir
size(A, 2)             					        % sutun sayisini verir
length(A)              					        % buyuk olan boyutun degerini verir, dolayisiyla vektorlerle
                       					        % kullanmak daha mantikli
										
% verilerin yuklenmesi

load featuresX.dat     					        % load komutu ile veriler yuklenebilir
load('featuresX.dat')  					        % esdeger komuttur, octaveda stringler tek tirnak icine alinir
featuresX              					        % dosya ismi yazilarak icindeki veriler gosterilebilir
size(featureX)         					        % komutu ile verilerin boyutlari alinabilir
save hypothesis.mat v   				        % v vektorunu hyptohesis.mat(binary) olarak kaydeder   
save hypothesis.txt v   				        % v vektorunu hyptohesis.txt(human-readable) olarak kaydeder

% indeksleme

A_32=A(3,2)            					        % 3. satir 2. sutundaki elemani dondurur
A(2,:)                 					        % 2. satirdaki tum elemanlari dondurur  
                       					        % : tum elemanlar anlamina gelir
A(:,2)                 					        % 2. sutundaki tum elemanlari dondurur
A([1 3], :)            					        % 1 ve 3. satirlardaki tum elemanlari dondurur
A(,:2)=[5; 7; 8]       					        % 2. sutuna belirtilen vektoru atar
A = [A, [5; 7; 8]]     					        % matrisin sagina belirtilen sutunu ekler
A(:)                   					        % matrisin tum elemanlarini tek bir sutun vektorune koyar
C = [A B]              					        % sintaksi ile iki matrisin yanyana birlesiminden yeni bir
                       					        % matris olusturulur
C = [A; B]             					        % sintaksi ile iki matrisin alt alta birlesiminden yeni bir
                       					        % matris olusturulur
                       
% islemler

A.*B                   					        % A ve B matrislerindeki birbirine karsilik düsen elemanlari carpar
                       					        % . genellikle element-wise islemleri belirtmek icin kullanilir
A.^2                   					        % A matrisindeki tum elemanlarin karesini alir
1./v                   					        % v vektorundeki tum elemanlarin carpmaya gore tersini alir
log(v)                 					        % v vektorundeki tum elemanlarin logaritmasini alir
exp(v)                 					        % v vektorundeki tum elemanlarin e tabaninda ussunu alir 
abs(v)                 					        % v vektorundeki tum elemanlarin mutlak degerini alir
v + ones(length(v), 1) 					        % her elemana 1 ekler
v + 1                  					        % bu sekilde de her elemana 1 eklenebilir
A'                     					        % A matrisinin transpozu
max(a)                 					        % a vektorunun en buyuk elemanini verir
[val, ind] = max(a)    					        % a vektorunun en buyuk elemanini ve indisini verir
max(A)                 					        % A matrisinin her bir sutunundaki en buyuk elemani vektor olarak verir
a < 3                  					        % a vektorunde kosulu saglayan elemanlar icin 1 saglamayanlar icin 0
		       		   					              % iceren bir vektor dondurur
find(a < 3)            					        % a vektorunde kosulu saglayan elemanlarin indisini verir
magic(3)                                % 3x3 boyutunda bir sihirli kare oluşturur
rand(3)                                 % rastgele elemanlardan olusan bir 3x3 matris dondurur
[r, c] = find(a < 3)   					        % kosulu saglayan elemanlarin satir ve sutun indislerini verir
                                        % birden fazla koşulu sağlayan eleman varsa satir ve sütun indislerini
                                        % vektör olarak döndürür  
sum(a)                				          % a vektorundeki elemanlarin toplamini verir
prod(a)                					        % a vektorundeki elemanlarin carpimini verir
floor(a)               					        % a vektorundeki elemanlari asagi yuvarlar
ceil(a)                					        % a vektorundeki elemanlari yukari yuvarlar
max(A, [], 1)          					        % A matrisinin her bir sutunundaki maksimum elemani verir
max(A, [], 2)          					        % A matrisinin her bir satirindaki maksimum elemani verir
                                        % max fonksiyonu default olarak sutuna gore maksimum alir
max(max(A))            					        % sintaksi ile A matrisinin en buyuk elemanini bulabiliriz
max(A(:))              					        % ya da A matrisini bir vektore donusturup en buyuk elemani buluruz
sum(A, 1)              					        % sutuna gore toplam
sum(A, 2) 	       						          % satira gore toplam
pinv(A)                					        % A matrisinin pseudo-tersi
                      
% grafik cizdirme

t = [0:0.01:1.0];      					        % t eksenindeki degerler
y = sin(2*pi*4*t);     					        % y eksenindeki degerleri veren fonksiyon
plot(t, y1)            					        % t ve y eksenlerinde grafigi cizdirir

hold on;              				          % hold on komutu kullanilirsa bir sonraki cizdirilecek
		       							                % grafik oncekinin uzerine cizdirilir
y2 = cos(2*pi*4*t);    					        % baska bir fonksiyon tanimlanir
plot(t, y2, 'r');      					        % onceki grafigin uzerine cizdirileceginden 
		       							                % karismamasi icin baska bir renk atamasi yapilir
xlabel('time')         					        % yatay eksen isimlendirilir
ylabel('value')        					        % dikey eksen isimlendirilir
legend('sine', 'cos')  					        % seklinde ekrandaki grafikler etiketlenebilir
title('my plot')       					        % grafik isimlendirilebilir
print -dpng 'myplot.png' 				        % ile grafik kaydedilebilir

figure(1); plot(t, y1); 				        % figure1 ve figure2 olarak ayri ayri 
figure(2); plot(t, y2); 				        % pencerelerde grafikler cizdirir

subplot(1, 2, 1);       				        % 1x2 bir cizim alani olusturur ve ilk kısma erisir
plot(t, y1);            				        % grafigi ekranin ilk kısmına cizdirir
subplot(1, 2, 2);       				        % ikinci kısma erisir
plot(t, y2);	        				          % grafigi ekranin ikinci kismina cizer
clf                     				        % figuru temizler
imagesc(A)              				        % A matrisini her bir elemana bir renk gelecek sekilde cizer
										                    % renkler buyukluge gore degisir
imagesc(A), colorbar, colormap gray;	  % renk olarak gri tonlarini kullanir ve bir colorbar gosterir
                                        % araya virgüller koyularak aynı anda birden fazla komutun icra 
                                        % edilmesi sağlanabilir. ; kullanılırsa ciktilar gozukmez
axis([0.5 1 -1 1])                      % seklinde eksenlerin sinirlari ayarlanabilir                  

% kontrol ifadeleri ve donguler

for i=1:10,                             % seklinde basit bir for dongusu kurulabilir
%***%
end;

indices=1:10
for i=indices,                          % seklinde bir kullanim da soz konusudur
%***%
end;

while kosul,                            % seklinde basit bir while dongusu kurulabilir
%***%
end;  

i=1                                     % basit bir ornek
while true,
  i = i+1;
  if i == 10,                           % kontrol ve dongu ifadelerinden sonra ',' ve end; ile bitişe
    break                               % dikkat edilmeli 
  end;
end;            

i=4
if i == 4,
  disp('The value is for')
elseif i==0,
  disp('The value is zero')
else,
  disp('The value is neither for nor zero')
end;

% fonksiyonlar

% fonksiyonlar .m uzantili dosyalarda saklanir ve kullanilacagi
% zaman octave fonksiyon tanımını .m uzantili dosyalarda arar                
   	
% tek argüman alan ve tek bir deger donduren ornek bir fonksiyon    
function y = squareThisNumber(x)
  y = x ^ 2;

% octave da birden fazla deger geri donduren fonksiyonlar yazmak mumkundur
function [y1, y2] = squareAndCubeThisNumber(x)
  y1 = x ^ 2;
  y2 = x ^ 3;  

% [a, b] = squareAndCubeThisNumber(5) seklinde bir syntax ile fonksiyona cagri yapilabilir

% fonksiyonlari calistirabilmek icin o anki dizin fonksiyon taniminin bulundugu
% dosyanın oldugu dizine getirilmeli ve ya addpath('fonksiyon-dizini') seklinde
% dosyanin pathi octave search pathe eklenmeli                      

          
