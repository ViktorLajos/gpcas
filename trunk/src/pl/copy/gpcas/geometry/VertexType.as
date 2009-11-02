/*
 * This license does NOT supersede the original license of GPC.  Please see:
 * http://www.cs.man.ac.uk/~toby/alan/software/#Licensing
 *
 * The SEI Software Open Source License, Version 1.0
 *
 * Copyright (c) 2004, Solution Engineering, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by the
 *        Solution Engineering, Inc. (http://www.seisw.com/)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 3. The name "Solution Engineering" must not be used to endorse or
 *    promote products derived from this software without prior
 *    written permission. For written permission, please contact
 *    admin@seisw.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL SOLUTION ENGINEERING, INC. OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 */

package pl.bmnet.gpcas.geometry {
   /**
    * Edge intersection classes
    */
   public class VertexType
   {
      public static const NUL:int=  0; /* Empty non-intersection            */
      public static const EMX:int=  1; /* External maximum                  */
      public static const ELI:int=  2; /* External left intermediate        */
      public static const TED:int=  3; /* Top edge                          */
      public static const ERI:int=  4; /* External right intermediate       */
      public static const RED:int=  5; /* Right edge                        */
      public static const IMM:int=  6; /* Internal maximum and minimum      */
      public static const IMN:int=  7; /* Internal minimum                  */
      public static const EMN:int=  8; /* External minimum                  */
      public static const EMM:int=  9; /* External maximum and minimum      */
      public static const LED:int= 10; /* Left edge                         */
      public static const ILI:int= 11; /* Internal left intermediate        */
      public static const BED:int= 12; /* Bottom edge                       */
      public static const IRI:int= 13; /* Internal right intermediate       */
      public static const IMX:int= 14; /* Internal maximum                  */
      public static const FUL:int= 15; /* Full non-intersection             */
      
      public static function getType( tr:int, tl:int, br:int, bl:int):int {
          return tr + (tl << 1) + (br << 2) + (bl << 3);
      }
   }

}