function xk=steepestdecentmethodwprojection(f,xs,e,gama,sk,a,b)
  %a,b τα όρια για κάθε μεταβλητή για την συγκεκριμένη (2x1)
  syms x1 x2 
  g=symvar(f);
  f=subs(f,g,g);
  grad=gradient(f);
  gradf=grad(x1,x2); %βάζουμε το gradient σε πίνακα για να κάνουμε πράξεις
  coeff=g-sk*gradf;
  coeff1=coeff(1,1);
  coeff2=coeff(2,2);
  k=1;
  xk(k,:)=xs;  %ξεκινάμε με xs=(x1,x2)
  gradfxk=double(subs(gradf,g,xk(k,:)));
  dk=-double(gradfxk); %δκ=-gradient(f(xk))
  xk(k+1,:)=xk(k,:)+sk*gama.*transpose(dk); %μέθοδος μέγιστης καθόδου  %υποθέτουμε ότι είναι εφικτό το 1ο σημείο
  k=k+1;
  gradfxk=double(subs(gradf,g,xk(k,:)));
  maxk=100;  %Για πάνω από maxk επαναλήψεις, βγες από την μέθοδο
  while e<=norm(gradfxk) && k<=maxk
      %Έλεγχος αν το νέο σημείο είναι εφικτό
      %k=k+1
      %Για το xk(1)
      if xk(k,1) <= a(1)%x1<=a1 
          if xk(k,2) <= a(2)  %x2<=a2
              xk(k+1,:) =(1-gama)*xk(k,:)+a*gama;
          elseif xk(k,2) >= b(2) %x2>=b2
              xbar=[a(1) b(2)];
              xk(k+1,:) =(1-gama)*xk(k,:)+xbar*gama; 
          else %a2<x2<b2
              xbar(1,1)=a(1);
              xbar(1,2)=subs(coeff2,g,xk(k,:));
              xk(k+1,:) =(1-gama)*xk(k,:)+xbar*gama; 
          end
      elseif xk(k,1) >= b(1)  %x1>=b1 
          if xk(k,2) <= a(2)  %x2<=a2
              xbar=[b(1) a(2)];
              xk(k+1,:) =(1-gama)*xk(k,:)+xbar*gama;
          elseif xk(k,2) >= b(2) %x2>=b2
              xk(k+1,:) =(1-gama)*xk(k,:)+b*gama; 
          else %a2<x2<b2
              xbar(1,1)=b(1);
              xbar(1,2)=subs(coeff2,g,xk(k,:));
              xk(k+1,:) =(1-gama)*xk(k,:)+xbar*gama; 
          end
      elseif a(1)<xk(k,1) && xk(k,1)<b(1) %a1<x1<b1
          if xk(k,2) <= a(2)  %x2<=a2
              xbar(1,1)=subs(coeff1,g,xk(k,:));
              xbar(1,2)=a(2);
              xk(k+1,:) =(1-gama)*xk(k,:)+xbar*gama; 
          elseif xk(k,2) >= b(2) %x2>=b2
              xbar(1,1)=subs(coeff1,g,xk(k,:));
              xbar(1,2)=b(2);
              xk(k+1,:) =(1-gama)*xk(k,:)+xbar*gama; 
          else %εφικτό σημείο
              dk=-double(gradfxk); %δκ=-gradient(f(xk))
              xk(k+1,:)=xk(k,:)+sk*gama.*transpose(dk); %μέθοδος μέγιστης καθόδου 
          end
      end
      k=k+1;
      gradfxk=double(subs(gradf,g,xk(k,:)));
      if k==maxk
          fprintf('Πολλές επαναλήψεις-> Η μέθοδος δεν συγκλίνει(ή συγκλίνει πολύ αργά) για γ=%d\n', gama)  
      end
  end
end